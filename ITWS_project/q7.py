s = raw_input("Enter string: ").lower()
rev = s[::-1]
if s == rev:
    print("Yes")
else:
    print("No")
