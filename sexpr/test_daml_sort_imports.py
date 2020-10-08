import daml_sort_imports as sut
import unittest
import io
import sys


class TestMultiLineImportStatement(unittest.TestCase):
    def test_(self):
        src = '''
import DA.ASX.Main.BizProcess.SettlementInstruction.Lang.FailsType (FailsType(..))
import DA.ASX.Main.BizProcess.SettlementInstruction.Lang
    ( CancelRequest(..)
    , CancelResponse(..)
    )
'''
        sut.sort_imports(io.StringIO(src), sys.stdout)


if __name__ == '__main__':
    unittest.main()
