## <font color=red> Control Constructs in shell</font> 
To allow users to automate tasks using shell script programs, BASH provide some basic control constructs for expressing program logic.

#### How to use condition in shell script ?
* If-else structure :

```sh
if  [ conditiong1 ]; then
  statement1
elif [ condition2 ]; then
  statement2
else
  statement3
fi
```
**It is must to put spaces between the `[ `braces and the `condition` being checked.**


**`String Comparisons:`**

| Option | Description |
| ------ | ------ |
| -n string |	True if length of string is non-zero |
| -z string |	True if length of string is zero |
| string1 == string2 |True if the strings are equal |
| string1 != string2 |	True if the strings are not equal|

> Finding max between two numbers :

* using **test** expression

```sh
#!/bin/sh

echo "Please input the first number"
read n1
echo "Please input the second number"
read n2

# Compare the numbers
if [ $n1 -gt $n2 ] ; then
 echo "The first number is greater"
elif [ $n1 -eq $n2 ] ; then
 echo "The numbers are equal"
else
 echo "The second one is greater"
fi
```
* using **(( ))**

```sh
#!/bin/sh

echo "Please input the first number"
read n1
echo "Please input the second number"
read n2

# Compare the numbers
if ((n1>n2)) ; then
 echo "The first number is greater"
elif ((n1==n2)) ; then
 echo "The numbers are equal"
else
 echo "The second one is greater"
fi
```

#### How to use **case** in shell script ?
The case construct allows for a multi-branch selection statement.

```sh
case $var in
condition1)  
  statement ;;
condition2)  
   statement ;;
*)                  # default case
   statement3 ;;
esac
```
> Notice that each pattern line is terminated with `double semicolons ;;`.You can put multiple statements between each pattern and the next, so a double semicolon is needed to mark where one statement ends and the next pattern begins.

```sh
#!/bin/sh

echo “Is it morning? Please answer yes or no”
read timeofday 

case “$timeofday” in
y | yes | Yes | YES ) echo “Good Morning”;;
n* | N* )             echo “Good Afternoon”;;
* )                   echo “Sorry, answer not recognized”;;
esac

```
#### `Command Line arguments` in shell script ?

Command line arguments can be passed to the shell scripts. There exists a number of built in variables. </br>
* `$*` ‐ command line arguments
* `$#` ‐ number of arguments 
* `$n` ‐ nth argument in `$*` 

> ./script_name arg1 arg2 .... argn
