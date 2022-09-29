# blog-gen

#### Summary
Emurgo Academy - Cardano Associate Program
Module: Haskell Programming
Project: A static blog page generator 
Author: Kelly Muhindi

#### Description
A simple static blog generator written in Haskell. 
The program will read specially formatted text from standard input or files and generate static HTML files that can be published.

#### Setup
* Clone the repo.
* Build the project: `stack build .`

#### Usage 
* Create a text file using formatting as shown in the example in `testOps/testInput`
* Run the program using the input file and specify the file name for the output
`stack exec blog-gen-exe testOps/testInput testOps/testOutput.html`


