import mysql.connector
import pickle

mydb=mysql.connector.connect(user='root',passwd='root',host='localhost',auth_plugin='mysql_native_password',database='bnak')

mycursor=mydb.cursor()#buffered=True)
#created Database Bank
#mycursor.execute('create database Bnak')

def Menu():
       print("*" *140)
       print("MAIN MENU" .center(140))
       print("1. Insert Record/Records" .center(140))
       print("2. Display records as per Account Number" .center(140))
       print("     a.Sorted as per Account Number  " .center(140))
       print("     b.Sorted as per customer Name  " .center(140))
       print("     c.Sorted as per Customer Balance " .center(140))
       print("3.  Search Record Details as per the account number  " .center(140))
       print("4.  Update Record  " .center(140))
       print("5.  Close Account  " .center(140))
       print("6.   TransactionsDebit/Withdraw from the account  " .center(140))
       print("       a. Debit/Withdraw from the account  " .center(140))
       print("       b. Credit into  the account  " .center(140))
       print("7.   Exit " .center(140))
       print("*" *140)

def MenuSort():
       print("      a.Sorted as per Account Number ". center(140))
       print("      b.Sorted as per Coustomer Name ". center(140))
       print("      c.Sorted as per Coustomer Balance ". center(140))
       print("      d.Back". center(140))

def MenuTransaction():
       print("      a.Debit/Withdraw from the account ". center(140))
       print("       b. Credit into  the account  " .center(140))
       print("       c.Back". center(140))

def Create():
       try:
              mycursor.execute('create table bank(ACCNO varchar (10) ,NAME varchar(20), MOBILE varchar(20), EMAIL varchar(50), ADDRESS varchar(100),CITY varchar(20),COUNTRY varchar(20), BALANCE varchar(20),ACCOUNT_TYPE(10)')
              print ("Table Created")
              Insert()
       except :
              print("Table Exists")
              Insert()
def Insert() :
       while True:               #Loop accepting records
              Acc=input("Enter account no:")
              Name=input("Enter Name:")
              Mob=input("Enter Mobile Number:")
              email=input("Enter email:")
              Add=input("Enter Address:")
              City=input("Enter city:")
              Country=input("Enter Country:")
              Bal=float(input("Enter Balance:"))
              Type=input("Enter account type:")
              Rec=[Acc,Name.upper(),Mob,email.upper(),Add.upper(),City.upper(),Country.upper(),Bal,Type.upper()]
              cmd="insert into BANK values (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
              mycursor.execute(cmd,Rec)
              mycursor.fetchall()
              mydb.commit()
              ch=input("Do you want to enter more records(N/n):")
              if ch=='N' or ch=='n':
                     break

def DispSortAcc():            #function to display records as per  ascending order of Account number
       try:
              cmd="select * from BANK order by ACCNO"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              F="%15s %15s %15s %15s %15s %15s %15s %15s %15s"
              print(F % ("ACCNO", "NAME", "MOBILE", "EMAIL ADDRESS","ADDRESS", "CITY","COUNTRY","BALANCE","ACCOUNT_TYPE"))
              print("=" *125)
              for i in S:
                     for j in i:
                            print("%14s" %j, end=' ')
                     print()
                     print("="*125)
       except :
              print("Table dosen't exists")

def DispSortName():    #function to Display record as per acending order of Account Number
       try:
              cmd="select * from BANK order by NAME"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              F="%15s %15s %15s %15s %15s %15s %15s %15s %15s "
              print(F % ("ACCNO", "NAME", "MOBILE", "EMAIL ADDRESS", "ADDRESS", "CITY","COUNTRY","BALANCE","ACCOUNT_TYPE"))
              print("=" *125)
              for i in S:
                     for j in i:
                            print("%14s" %j, end=' ')
                     print()
              print("="*125)
       except :
              print("Table dosen't exists")

def  DispSortBal():    #function to Display record as per acending order of Account Number
       try:
              cmd="select * from BANK order by BALANCE"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              F="%15s %15s %15s %15s %15s %15s %15s %15s %15s"
              print(F % ("ACCNO", "NAME", "MOBILE", "EMAIL ADDRESS","ADDRESS", "CITY","COUNTRY","BALANCE","ACCOUNT_TYPE"))
              print("=" *125)
              for i in S:
                     for j in i:
                            print("%14s" %j, end=' ')
                     print()
              print("="*125)
       except :
              print("Table dosen't exists")

def DispSearchAcc():   #function to search for the record from the file with respect to the account number
       try:
              cmd="select * from BANK "
              mycursor.execute(cmd)
              ch=input("enter the accountno to be searched:")
              for i in mycursor:
                     if i[0]==ch:
                            print("=" *125)
                            F="%15s %15s %15s %15s %15s %15s %15s %15s %15s"
                            print(F % ("ACCNO", "NAME", "MOBILE", "EMAIL ADDRESS","ADDRESS", "CITY","COUNTRY","BALANCE","ACCOUNT_TYPE"))
                            print("=" *125)
                            for j in i:
                                   print("%14s" %j, end=' ')
                            print()
                            break
              else :
                     print("Record Not found")
       except :
              print("Table dosen't exists")

def Update():   #function to change the details of a customer
       try:
              cmd="select * from BANK"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              A=input("Enter the account no whose details to be changed:")
              for i in S:
                     i=list(i)
                     if i[0]==A:
                            ch=input("change Name(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[1]=input("Enter Nmae:")
                                   i[1]=i[1].upper()
                            ch=input("Change Mobile (Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[2]=input("Enter Mobile:")
                                   i[2]=i[2].upper()
                            ch=input("Change Email(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[3]=input("Enter email:")
                                   i[3]=i[3].upper()
                            ch=input("Change Address(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[4]=input("Enter Address:")
                                   i[4]=i[4].upper()
                            ch=input("Change city(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[5]=input("Enter city:")
                                   i[5]=i[5].upper()
                            ch=input("Change Country(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[6]=input("Enter country:")
                                   i[6]=i[6].upper()
                            ch=input("Change Balance(Y/N):")
                            if ch=='y' or ch=='Y':
                                   i[7]=float(input("Enter amount:"))
                                   i[7]=i[7].upper()
                            if ch=='y' or ch=='Y':
                                   i[8]=input("Enter Account_Type:")
                                   i[8]=i[8].upper()
                            cmd="UPDATE BANK SET NAME=%s, MOBILE=%s, EMAIL=%s, ADDRESS=%s, CITY=%s, COUNTRY=%s, BALANCE=%s,ACCOUNT_TYPE=%s WHERE ACCNO=%s"
                            val=(i[1], i[2], i[3], i[4], i[5], i[6], i[7],i[8], i[0])
                            mycursor.execute(cmd,val)
                            mydb.commit()
                            print("Account Updated")
                            break
              else :
                     print("Record not found")
       except:
              print("No suchbTable")

def Close():     #Function to delete the details of a customer
       try:
              cmd="select * from BANK"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              A=input("Enter the account no to close the account:")
              for i in S:
                     i=list(i)
                     if i[0]==A:
                            cmd="delete from bank where accno=%s"
                            val=(i[0],)
                            mycursor.execute(cmd,val)
                            mydb.commit()
                            print("Account closed")
                            break
              else:
                     print("Record not found")
       except:
              print("No such Table")


def Debit():      #Function to withdraw the amount by assuring the min balance of Rs 5000
       try:
              cmd="select * from BANK"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              acc=input("Enter th account no from the money is to be debited:")
              for i in S:
                     i=list(i)
                     if i[0]==acc:
                            Amt=float(input("Enter the amount to be withdrawn:"))
                            res=float(i[7])
                            res-=Amt
                            i[8]=str(res)
                            cmd="UPDATE BANK SET BALANCE=%s WHERE ACCNO=%s"
                            val=(i[8],i[0])
                            mycursor.execute(cmd,val)
                            mydb.commit()
                            print("Amount Debited")
                            break
              else:
                     print("Record not found")
       except:
              print("Table doesn't exist")
def Credit():  #Function to credit the amount
       try:
              cmd="select * from BANK"
              mycursor.execute(cmd)
              S=mycursor.fetchall()
              acc=input("Enter the account no from the money  is to be debited:")
              for i in S:
                     i=list(i)
                     if i[0]==acc:
                            Amt=float(input("Enter the amount to be credited:"))
                            res=float(i[7])
                            res +=Amt
                            i[8]=str(res)
                            cmd="UPDATE BANK SET BALANCE=%s WHERE ACCNO=%s"
                            val=(i[8],i[0])
                            mycursor.execute(cmd,val)
                            mydb.commit()
                            print("Amount credited")
                            break
              else:
                     print("Record not found")
       except:
              print("Table Dosen't exist")

while True:
       Menu()
       ch=input("Enter your choice:")
       if ch=="1":
              Create()
       elif ch=="2":
              while True:
                     MenuSort()
                     ch1=input("Enter choice a/b/c/d:")
                     if ch1 in ['a' , 'A']:
                            DispSortAcc()
                     elif ch1 in ['b', 'B']:
                            DispSortName()
                     elif ch1 in ['c', 'C']:
                            DispSortBal()
                     elif ch1 in ['d', 'D']:
                            print("Back to the main menu")
                            break
                     else:
                            print("Invalid choice")
       elif ch=="3":
              DispSearchAcc()
       elif ch=="4":
              Update()
       elif ch=="5":
              Close()
       elif ch=="6":
              while True:
                     MenuTransaction()
                     ch1=input("Enter choice a/b/c:")
                     if ch1 in ['a','A']:
                            Debit()
                     elif ch1 in ['b','B']:
                             Credit()
                     elif ch1 in ['c','C']:
                            print("Back to the main menu")
                            break
                     else:
                            print("Invalid choice")
       elif ch=="7":
              print("Exiting.....")
              break
       else:
              print("wrong choice Entered")
