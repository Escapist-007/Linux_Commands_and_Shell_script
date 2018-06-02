## <font color=red> Loop  in Shell Script</font> 
`for` | `while`| `until`

#### FOR loop structure :

```sh
Form 1:
======

for { variable name } in { list }
do
  execute one for each item in
  the list until the list is
  not finished (and repeat all
  statement between do and done)
done

Form 2:
=======

for (( expr1; expr2; expr3 ))
do
  repeat all statements between do and
  done until expr2 is TRUE
done

```

> Demo script 01 :
```sh
#!/bin/bash 

# Name of the script : loop_test.sh

echo "The number of command line argument is $#" 
a=1 
for i in $* 
do 
  echo "The $a number argument is $i" 
  ((a=a+1)) 
done

```
**Output :**
```sh
$ ./loop_test.sh monir is good

The number of command line argument is 3
The 1 number argument is monir
The 2 number argument is is
The 3 number argument is good

```
> Demo script 02 :

```sh
#!/bin/bash 

for i in `ls` 
do 
 echo $i 
done

Output:
=======
Will print all the file & folder name in the current directory
```
> Demo script 03 :

```sh
#!/bin/bash

for (( i = 0 ; i < 3; i++ ))
do
 echo "Welcome $i times"
done
```
```sh
Output :
=======
Welcome 0 times
Welcome 1 times
Welcome 2 times

```
> Demo script 04 :

```sh
#!/bin/bash
PASSWORDFILE=/etc/passwd
n=1
for name in $(cut -f 1 -d : $PASSWORDFILE)
do
 echo "User #$n = $name"
 let "n += 1"
done
```
```sh
This script will list all the Users.
```

#### WHILE loop structure :
```sh
while condition 
do
 statements
done
```
> Demo script :

```sh
#!/bin/bash

password="abc"

echo "Enter password"
read pass

while [ $pass != $password ]
do
 echo "Wrong Password,Try again"
 read  pass
done

echo "Correct Password !"

```

#### UNTIL loop structure :

```sh
until condition 
do
 statements
done
```
> Demo script :

```sh
#!/bin/bash

password="abc"

echo "Enter password"
read pass

until [ $pass = $password ]
do
 echo "Wrong Password,Try again"
 read  pass
done

echo "Correct Password"
```