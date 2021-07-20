import dataclasses
import re
from typing import *
import os
import json
import regex


example_oneline = """case class SecurityId(`unpack`: Primitive.Text) extends ValueType["""


example_simple = """noise...
case class ProjectedSettlementObligationSide(
    `operator`: Primitive.Party,
    `id`: daml_stuff.DA.ASX.Main.Lang.SettlementInstructionId.SettlementInstructionId,
    `numberOfSettlementInstructions`: daml_stuff.DA.ASX.Main.Lang.TradeCount.TradeCount
) noise....
"""


example = """noise...
case class ProjectedSettlementObligationSide(
    `operator`: Primitive.Party,
    `id`: daml_stuff.DA.ASX.Main.Lang.SettlementInstructionId.SettlementInstructionId,
    `delivererOrReceiver`: daml_stuff.DA.ASX.Main.Lang.DelivererOrReceiver.DelivererOrReceiver,
    `instructionType`: daml_stuff.DA.ASX.Main.BizProcess.BatchSettlement.ProjectedSettlementObligation.Lang.ProjectedInstructionType,
    `securityId`: daml_stuff.DA.ASX.Main.Lang.SecurityId.SecurityId,
    `determinedBoms`: Primitive.List[daml_stuff.DA.Types.Tuple2[
      daml_stuff.DA.ASX.Main.Lang.CorporateActionId.CorporateActionId,
      daml_stuff.DA.ASX.Main.Lang.BOM.ExOrCum
    ]],
    `settlementDate`: daml_stuff.DA.ASX.Main.Lang.SettlementDate.SettlementDate,
    `cashAmount`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.CashAmount.CashAmount],
    `unitAmount`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.UnitQuantity.UnitQuantity],
    `obligationId`: daml_stuff.DA.ASX.Main.Lang.ObligationId.ObligationId,
    `node`: daml_stuff.DA.ASX.Main.BizProcess.BatchSettlement.Lang.GraphNodeId.GraphNodeType,
    `accountId`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.AccountId.AccountId],
    `actorId`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.UIC.UIC],
    `trustAmount`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.TrustAmount.TrustAmount],
    `optHoldingLocks`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.HoldingLocks.HoldingLocks],
    `partialSettlementIndicator`: daml_stuff.DA.ASX.Main.Lang.PartialSettlementIndicator.PartialSettlementIndicator,
    `currency`: Primitive.Optional[daml_stuff.DA.ASX.Main.Lang.Currency.Currency],
    `failCount`: daml_stuff.DA.ASX.Main.Lang.SettlementFailCount.SettlementFailCount,
    `numberOfSettlementInstructions`: daml_stuff.DA.ASX.Main.Lang.TradeCount.TradeCount
) noise....
"""


code_gen_root = '/home/weining/work/da/solution-spider/tools/rearch/codegen/build/codegen'
primitive_module = '/home/weining/work/da/solution-spider/tools/rearch/codegen/src/main/codegen-static/com/digitalasset/codegen/package.scala'


CaseClassT = ForwardRef('CaseClass')
TyT = ForwardRef('Ty')


@dataclasses.dataclass
class Ty:
    name: str
    parameters: str
    module: str
    case_class: Optional[CaseClassT]

    @classmethod
    def from_raw(cls, val1):
        parameters = ''
        brackets = parse_brackets(val1)
        if brackets:
            val1 = val1.replace(brackets, '')
            parameters = brackets[1:-1]

        segments = val1.rsplit('.', 1)
        if len(segments) == 1:
            name, module = segments[0], ''
        else:
            module, name = segments
        if module.startswith('Primitive') or module.startswith('daml_stuff.DA.Types'):
            return cls(name, parameters, module, None)
        else:
            with open(cls.resolve_module_path(module, name), 'r') as fp:
                blob = fp.read()
                case_class = extract_case_class_with_name(blob, name)
                return cls(name, parameters, module, case_class)
    
    @staticmethod
    def resolve_module_path(module, name):
        pth = os.path.join(code_gen_root, module.replace('.', os.path.sep), name + '.scala')
        assert os.path.isfile(pth), f'module is path is invalid!\n{pth}'
        return pth


@dataclasses.dataclass
class Field:
    name: str
    ty: Ty

    @classmethod
    def from_raw(cls, val1):
        tokens = [s.strip('` ') for s in val1.split(':')]
        assert len(tokens) == 2, str(tokens)
        name, ty = tokens
        return cls(name, Ty.from_raw(ty))


@dataclasses.dataclass
class CaseClass:
    name: str
    fields: List[Field]

    @classmethod
    def from_raw(cls, val1, val2):
        name = val1.strip()
        tokens = [t.strip() for t in val2.split('###')]
        fields = [Field.from_raw(t.replace(' ', '').strip(', ')) for t in tokens if t]
        return cls(name, fields)


def extract_case_class(blob):
    blob = preprocess(blob)
    o = re.search(r'case class (\w+)\((.+?)\)', blob)
    if not o:
        return None
    return CaseClass.from_raw(*o.groups())


def extract_case_class_with_name(blob, name):
    blob = preprocess(blob)
    regex = r'case class ' + name + r'\((.+?)\)'
    o = re.search(regex, blob)
    if not o:
        return None
    return CaseClass.from_raw(name, o.groups()[0])


def preprocess(blob):
    b1 = blob.replace('\n', '')
    return re.sub(r'(?<=[\(\s])`', '###', b1) 


def parse_brackets(s: str) -> str:
    result = regex.search(r'''
        (?<rec> #capturing group rec
          \[ #open parenthesis
          (?: #non-capturing group
          [^\[\]]++ #anyting but parenthesis one or more times without backtracking
          | #or
          (?&rec) #recursive substitute of group rec
          )*
        \] #close parenthesis
        )
    ''',s,flags=regex.VERBOSE)
    if not result:
        return ''
    return result.groups()[0]


if __name__ == '__main__':
    o = extract_case_class(example)
    s = json.dumps(dataclasses.asdict(o), indent=2)
    print(s)

