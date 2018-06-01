## <font color=red> `Shell script`</font> 

#### What is Shell Script ? 

* Normally shells are `interactive`.
* It means shell accepts command from you (via keyboard) and execute them.
* But if you use command one by one (sequence of n number of commands), then you can store this sequence of commands to a text file that you can invoke as a program and tell the shell to execute the text file instead of entering the commands.
* This is know as **shell script**.
* We will use **`bash`** shell assuming that the shell has been installed as `/bin/sh` and that it is the default shell for our login.

> BASH ==>  Bourne Again Shell

#### Why Shell Script?
* Shell script can take input from user, `file` and output them on screen.
* Useful to create our own commands.
* Save lots of time.
* **To automate some task of day to day life.**
* System administration's part can be also automated.

#### How to Write and Execute Shell Script?
Use any editor (nano,vim etc) to write shell script. 
* The extension is `.sh`.
* After writing shell script, set **execute permission** for your script :-
 ```sh
 $ chmod +x script_name
 ```
* Execute your script `./script_name`

#### Shell script format
* Every script starts with the line **#!/bin/bash**
* This indicates that the script should be run in the bash shell regardless of which interactive shell the user has chosen.
* This is very important, since the syntax of different shells can vary greatly.
*  `#` is used as the comment character. A word beginning with `#` causes that word and all remaining characters on that line to be ignored.

#### A simple bash script
```sh
#!/bin/bash
echo "Hello User"
echo "See the files in current directory"
ls -1
```
  
#### `Variables` in Shell

In Linux (Shell), there are 2 types of variable:
* `System variables [SV]` - Created and maintained by Linux itself. This type of variables are defined in **CAPITAL LETTERS**.
> echo $USER </br>
> echo $PATH </br>
> echo $PWD

You can see system variables by giving command like :
```sh
$ set
```
* `User defined variables (UDV)` - Created and maintained by user. This type of variable are normally defined in **lower letters**.

* All variables are considered and stored as `strings`, even when they are assigned numeric values.

* Do not modify system the variables, this can some
time create problems.

#### <font color=blue> How to Define `User Defined Variables` (UDV)? </font>

> **variable_name=value**

* **Don't put spaces on either side of the equal sign when
assigning value to variable. There will be problem for
the following :**
```sh
$ no =10
$ no= 10
$ no = 10
```
* Variables are `case-sensitive`. Do not use `?, * `etc, to name your variable names.
* Within the shell we can access the contents of a variable by preceding its name with a `$`. **For getting the value we need dollar ($)** :stuck_out_tongue:

```sh
#!/bin/bash
  
myname=Monir  [use quotes if the value contains spaces] 
myos=Linux 
text=1+2 
  
echo Your name:$myname   [Monir] 
echo Your os:$myos       [Linux] 
echo $text               [1+2]
```
* If you enclose a `$variable expression` in double quotes, it's replaced with its value when the line is executed. If you enclose it in single quotes, no substitution takes place. You can also remove the special meaning of the $ symbol by prefacing it with a \.

```sh
myvar="Hello"

echo $myvar   [ Hello ] 
echo "$myvar" [ Hello ] 
echo '$myvar' [ $myvar ] 
echo \$myvar  [ $myvar ]
```

#### The `read` command - Take input from user
* Get input (data from user) from keyboard and store (data) to variable
> read variable1, variable2,...variableN

```sh
#!/bin/bash 

echo -n "Enter your name:"
read name 

echo -n "Enter your student no:" 
read stdno 

echo "Your Name :$name" 
echo "Your student number :$stdno"
```

#### Shell Arithmetic

* The **expr** command evaluates its `arguments as an expression`. **expr** became popular in the days of the Bourne Shell, which did not support math. *With Bash and Korn shell, it is generally not needed*. Since it is a command, command substitution is needed. We are still treating the variable as a string. As you can see, it is picky about `spaces`.

> expr expr1 math-operator expr2


```sh
#!/bin/bash

# Increment a variable
z=5
z=`expr $z+1`   ---- Need spaces around + sign.

echo $z
> 5+1

z=`expr $z + 1`

echo $z
> 6

```
* A Bash and Korn shell built-in command for math is **let**. As you can see, it is also a little picky about spaces, but it wants the opposite of what **expr** wanted. `let` also relaxes the normal rule of needing a $ in front of variables to be read.

```sh
#!/bin/bash

let z=5
echo $z
> 5
 
let z=$z+1
echo $z
> 6
$ let z=$z + 1     # --- Spaces around + sign are bad with let
-bash: let: +: syntax error: operand expected (error token is "+")

let z=z+1         # --- no $ to read a variable.
$echo $z
> 7
```

* With the BASH shell, whole arithmetic expressions may be placed inside `double parenthesis`. **This form is more forgiving about spaces.**

```sh
#!/bin/bash

((e=5))
echo $e
> 5

(( e = e + 3 ))
echo $e
> 8

(( e=e+4 ))  # -- spaces or no spaces, it doesn't matter
 echo $e
> 12
```
> Demo Scripts :

* Using **expr**

```sh
#!/bin/sh


a=10
b=20

val=`expr $a + $b`
echo "a + b : $val" 

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"


OUTPUT :
------------
a + b : 30
a - b : -10
a * b : 200
b / a : 2
b % a : 0
```
* Using **let**
```sh
#!/bin/sh

let a=32
let b=10

let val=a+b
echo "a + b : $val"

let val=a-b
echo "a - b : $val"

let val=a*b
echo "a * b : $val"

let val=a/b
echo "b / a : $val"

let val=a%b
echo "b % a : $val"


OUTPUT :
------------
a + b : 42
a - b : 22
a * b : 320
b / a : 3
b % a : 2
```
* Using **(( ))**

```sh
#!/bin/sh

let a=32
let b=10

((val=a+b))
echo "a + b : $val"

((val=a-b))
echo "a - b : $val"

((val=a*b))
echo "a * b : $val"

((val=a/b))
echo "b / a : $val"

((val=a%b))
echo "b % a : $val"


OUTPUT :
------------
a + b : 42
a - b : 22
a * b : 320
b / a : 3
b % a : 2
```




