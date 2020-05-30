#!/usr/bin/env python

import os
import re
import sys
import argparse


class CaseCost:
    def __init__(self, case):
        self.case = case
        self.cost = case.nsteps()

    def __eq__(self, o):
        if isinstance(o, int):
            return self.cost == o
        return self.cost == o.cost

    def __lt__(self, o):
        if isinstance(o, int):
            return self.cost < o
        return self.cost < o.cost

    def __le__(self, o):
        if isinstance(o, int):
            return self.cost <= o
        return self.cost <= o.cost

    def __gt__(self, o):
        if isinstance(o, int):
            return self.cost > o
        return self.cost > o.cost

    def __ge__(self, o):
        if isinstance(o, int):
            return self.cost >= o
        return self.cost >= o.cost

    def __add__(self, o):
        if isinstance(o, int):
            return self.cost + o
        return self.cost + o.cost

    def __radd__(self, o):
        if isinstance(o, int):
            return o + self.cost
        return o.cost + self.cost


def n_th(workload, n):
    for start in range(n):
        yield [workload[idx] for idx in range(start, len(workload), n)]


class SumCalculator:
    def __init__(self, s):
        self._s = s
        self._prefix_sum = [0] * (len(self._s) + 1)
        for idx in range(1, len(self._s) + 1):
            self._prefix_sum[idx] = self._s[idx - 1] + \
                    self._prefix_sum[idx - 1]

    def __call__(self, idx_start, idx_end):
        return self._prefix_sum[idx_end] - self._prefix_sum[idx_start]


class LP:
    MAX_COST = 0xFFFFFF

    def __init__(self):
        self._s = None
        self._k = None
        self._costs = None
        self._seps = None
        self._result = None
        self._calc = None

    def _init(self):
        self._calc = SumCalculator(self._s)

        self._costs = list()
        for row_idx in range(len(self._s) + 1):
            self._costs.append([0 for column_idx in range(self._k + 1)])
        # 1s
        for column_idx in range(self._k + 1):
            self._costs[1][column_idx] = self._s[0]
        # 1s
        for row_idx in range(len(self._s) + 1):
            self._costs[row_idx][1] = self._calc(0, row_idx)

        self._seps = list()
        for row_idx in range(len(self._s) + 1):
            self._seps.append([0 for column_idx in range(self._k + 1)])

        self._result = list()

    def _process(self):
        for idx in range(2, len(self._s) + 1):
            for numsubseqs in range(2, self._k + 1):
                self._costs[idx][numsubseqs] = self.MAX_COST
                self._process_each(idx, numsubseqs)

    def _process_each(self, idx, numsubseqs):
        prev_numsubseqs = numsubseqs - 1
        for prev_idx in range(0, idx):
            cost_prev = self._costs[prev_idx][prev_numsubseqs]
            cost_curr = self._calc(prev_idx, idx)
            cost = max(cost_prev, cost_curr)
            if cost < self._costs[idx][numsubseqs]:
                self._costs[idx][numsubseqs] = cost
                self._seps[idx][numsubseqs] = prev_idx

    def _get_result(self, idx, numsubseqs):
        if numsubseqs == 1:
            pair = (self._s[0:idx], self._calc(0, idx))
            self._result.append(pair)
            return
        prev_idx = self._seps[idx][numsubseqs]
        self._get_result(prev_idx, numsubseqs - 1)
        pair = (self._s[prev_idx:idx], self._calc(prev_idx, idx))
        self._result.append(pair)

    def __call__(self, s, k):
        self._s = s
        self._k = k
        self._init()
        self._process()
        self._get_result(len(self._s), self._k)
        return self._result


def partition(s, k):
    return LP()(s, k)


def partition_cases(cases, num_partitions=8):
    cost_items = [CaseCost(c) for c in cases]
    for ci_partition, cost_partition in partition(cost_items, num_partitions):
        print('cost:', cost_partition, 'num_cases:', len(ci_partition))
        yield sorted(cost_item.case.to_list_item()
                     for cost_item in ci_partition)
