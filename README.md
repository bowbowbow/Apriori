Apriori Assignment
==================

C++ Implementation of Apriori Algorithm

To run the implementation 
=========================

1. Keep project files in one folder.

2. compile using command `make`.
> To compile without using the makefile, type the following command.
>
> `g++ -std=c++11 apriori.cpp -o apriori.exe`
> 
> (Note that -std=c++11 option is must be given in g++.)

3. Run using following command.
> apriori.exe [min support (%)] [input file name] [output file name]
>
> ex. apriori.exe 5 input.txt output.txt

Summary of the algorithm
============
Apriori algorithm is to find frequent itemsets using an iterative level-wise approach based on candidate generation.
> **Input**: A database of transactions, the minimum support count threshold
> 
> **Output**: frequent itemsets in the database

The algorithm solves the problem with a two-step approach.

**Step1**. Frequent Itemset Generation
> Generate all itemsets whose support with a value of minimum support or greater.
>
> But the proccess requires a lot of computation (O(3^(k)-2^(k+1)+1), k=the number of item).
> 
> `The key idea of apriori algorithm`to reduce this operation is that any subset of a frequent itemset must be frequent.
> 
> Therefore, if there is any itemset which is infrequent, its superset should not be generated/tested.
>
> As a result, follow the steps below to proceed with this process.
>
> 1. Generate length (k+1)-candidate itemsets from length k frequent itemsets. (This process is called joining.)
>
> 2. And delete newly generated (k+1)-items if the item set that removed one element is not in (k)-candidate. (This process is called pluning.)
> 
> 3. Calculate the support of the candidates and remove candidates with support less than min support.
>
> 4. Proceed 1 again until there are no more candidates left.

**Step2**. Associate Rule Generation
> Generate high confidence rules from each frequent itemset, where each rule is a binary partition of a frequent itemset.

Any other specification of the implementation and testing
============

Note that I use c++11, not c++. therefore -std=c++11 option is must be given in g++.

Since the test code uploaded to Hanyang Portal is for Windows, I added checker class for using in Unix. 

About input file
============

**Input file format**

[item_id]`\t`[item_id]`\n`

[item_id]`\t`[item_id]`\t`[item_id]`\t`[item_id]`\t`[item_id]`\n` 

[item_id]`\t`[item_id]`\t`[item_id]`\t`[item_id]`\n`

- Row is transaction
- [item_id] is a numerical value
- There is no duplication of items in each transaction

About output file
============

**output file format**

[item_set]`\t`[associative_item_set]`\t`[support(%)]`\t`[confidence(%)]`\n`

[item_set]`\t`[associative_item_set]`\t`[support(%)]`\t`[confidence(%)]`\n`

- Support: probability that a transaction contains [item_set] [associative_item_set]
- Confidence: conditional probability that a transaction having [item_set] also contains [associative_item_set]
- The value of support and confidence should be rounded to two decimal places.

