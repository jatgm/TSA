MR = [10, 7, 8, 2, 3, 3, 5, 0, 6, 1]
OR = [3, 5, 2, 3, 1, 6, 3, 2, 4, 3]

for i in range(10):
    if MR[i]>OR[i]:
        print("Game " + str(i+1) + ": win")
    if MR[i]<OR[i]:
        print("Game " + str(i+1) + ": loss")
    if MR[i]==OR[i]:
        print("Game " + str(i+1) + ": draw")
