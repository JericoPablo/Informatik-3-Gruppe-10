import random, string

#FilterableList class. extends from list
class FilterableList(list):

    # add Method. inputparameter is the value of an element
    # looks if the element is from the same type as the first one 
    def add(self,value):
        try:
            if len(self)==0 or isinstance(value, type(self[0])):
                self.append(value)
            else:
               raise TypeError("Can't add different types to filerableList")
        except TypeError as e:
            print(e.args)

    #remove Method. input parameter is the value that you want to delete
    def removeElement(self,value):
        if self.index(value):
            self.remove(value)

    #has Method. inputparameter is the value that you search for
    #returns a boolvalue of the result
    def has(self,value):
        if value in self:
            hasValue=True
        else:
            hasValue=False
        return hasValue

    #filter Method. combines each value of the list with the lambdaexpression and saves true values to a resultlist
    #input parameter is a lambda expression
    #returns a filtertableList
    def filter(self,lambdaExp):
        
        resultlist=FilterableList()

        for member in self:
            l=lambdaExp
            if (l(member)):
                resultlist.add(member)

        print(resultlist)
        return resultlist
        
# main Method 
floatlist=FilterableList()

#generates random  floatnumbers and adds them to a float list
for i in range(1,10):
    rand=random.uniform(-100, 100)
    rand=float('%.2f' % rand)
    floatlist.add(rand)

floatlist.add("Hallo")


print(floatlist)
                                                # Float Lambdas
floatlist.filter(lambda x: x < 0)               #1. all negative numbers
floatlist.filter(lambda x: x <= 5)              #2. all numbers ≤ 5
floatlist.filter(lambda x: round(x) % 2 == 0)   #3. all straight numbers

stringlist=FilterableList()

#generates random strings and adds them to a stringlist
for i in range(1,10):
    rand=''.join(random.choice(string.ascii_lowercase) for j in range(random.randint(1,6)))
    stringlist.add(rand)

print(stringlist)
                                                # String Lambdas
stringlist.filter(lambda x : len(x) >= 3)       #1. words with a length ≥ 3
stringlist.filter(lambda x : "s" in x)          #2. words that contains an ”s”