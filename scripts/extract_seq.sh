#!/usr/bin/bash
#Commands to extract sequence headers from a fasta file

grep "^>" nrf1_seq.fa >> ../results/sequence_names.txt
grep "^>" nrf1_seqtemp.fa >> ../results/sequence_names.txt
