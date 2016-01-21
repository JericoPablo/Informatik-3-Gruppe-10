import string

# Mathfunctions class
class mathFunctions():

    # max Method. Inputparameters are a mathexpressionList and a value
    # the method combines every lambdaexpression with the number and saves the best result in the variable 'number' 
    # the method returns the lambdaexpression with the best result for x 
    def max(mathExp,x):

        number=0
        counter=1
        bestCounter=0
        bestMath=0
        
        for member in mathExp:
            m=member
            result=m(x)
            print(result)

            if result > number:
                number=result
                bestMath=m
                bestCounter=counter

            counter=counter+1

        print("best max value of the input lambdas is "+str(number)+". It's the "+str(bestCounter)+". Lambda Expression")
        return bestMath
    
    #Sum Method. Inputparameters are a mathexpression and two int values.
    #the method sums app all results for the mathlambda with each number between the two values.
    #the method returns this result
    def sum(mathExp,lo,hi):

        result=0
        
        for counter in range(lo+1,hi):
            result+=mathExp(counter)

        print("the result of the sum is "+str(result))
        return result


#Main method
f1=(lambda x: (x**2)+3)
f2=(lambda x: x+(3*x))
f3=(lambda x: 2*(x**2)+3*x)


mathExp=list()
mathExp.append(f1)
mathExp.append(f2)
mathExp.append(f3)


mathFunctions.max(mathExp,2.0)

mathFunctions.sum(lambda x: (x**2),2,5)