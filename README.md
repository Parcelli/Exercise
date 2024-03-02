# Exercise
This repository contains the assignment on Introduction to Linux
## Questions and solutions

1. Create a project directory called Exercise. Which commands did you use?

```
#creating a directory using mkdir command
mkdir Exercise

```

2. In the directory, create all the sub-directories you would need for a Bioinformatics
Project

```
cd Exercise
mkdir -p data scripts results
```

3. With the provided dataset files, put them in the appropriate directories you created
under your Bioinformatics Project

```
#Using the mv command to move the datasets from downloads folder to data folder
cd data
mv ../nrf1_seq* ./
```
 
4. Extract the sequence headers and save into a file `sequence_names.txt` in the
appropriate directory

```
#Extracting sequence headers using grep

grep "^>" nrf1_seq.fa >> ../results/sequence_names.txt
grep "^>" nrf1_seqtemp.fa >> ../results/sequence_names.txt

```
5. Save the commands you used in question 4 in a script file `extract_seq.sh`
```
nano extract_seq.sh
#!/usr/bin/bash
#Commands to extract sequence headers from a fasta file

grep "^>" nrf1_seq.fa >> ../results/sequence_names.txt
grep "^>" nrf1_seqtemp.fa >> ../results/sequence_names.txt

```

6. Count the number of mRNA.
```
grep -c "mRNA" nrf1_seq.fa
#Output : 90
grep -c "mRNA" nrf1_seqtemp.fa
#Output : 90  
```
- What other sequences apart from mRNA?
```
cDNA
```
- For each category, how many are there?
```
 grep -v "mRNA" sample_headers.txt |wc
#output : 20
```
  
- Save the above output to files.
```
 grep -v "mRNA" sample_headers.txt > non_mrna.txt
```
7. How many organisms (create a file with the organisms without duplicates)
```
#Extracting organisms and saving in file species.txt
grep ">" sequence_names.txt | cut -d, -f1 | sed 's/PREDICTED://g' | awk '{print $2,$3}' >> species.txt

#Counting unique species
sort species.txt | uniq |wc

#Output : 36 unique organisms
```

8. How many are predicted?
```
 grep -c  "PREDICTED" sequence_names.txt
#Output : 156
```
9. How many nucleotides are in the file? How many of each of the bases are there?
