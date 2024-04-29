def read_file():
    #Task1
    while True:
        file_name = input("Enter file name: ")
        try: 
            with open(file_name, 'r') as file:
                content = file.read()
        except FileNotFoundError:
            print("File not found. Please enter again.")
        else:
            print("File exists. You can access it to read.")
            
            #Task2
            print("====Anayzing===")
            with open(file_name, 'r') as file:
                lines = file.readlines()
                invalid_line = 0
            for line in lines:
                char_lst = line.strip("\n").split(",")
                if len(char_lst) != 26:
                    print("Invalid line of data: does not contain exactly 26 values:\n", line)
                    invalid_line += 1
                elif len(char_lst[0]) != 9 or char_lst[0][0] != "N" or char_lst[0][1:9].isdigit() == False:
                    print("Invalid line of data: N# is invalid:\n", line)
                    invalid_line += 1
            if invalid_line == 0:
                print("No errors found!")
            print("====Report====")
            print("Total valid lines of data:", len(lines) - invalid_line)
            print("Total invalid lines of data:", invalid_line, "\n")
            
            #Task3
            with open("answer_key.txt", "r") as f:
                ans_keys = f.readline().strip("\n")
            ans_key_lst = ans_keys.split(",")
            
            stu_scores = {}
            skip_count = {}
            incorrect_count = {}
            
            for question in range(1, 26):
                skip_count[question] = 0
                incorrect_count[question] = 0
            
            for line in lines:
                ans_lst = line.strip("\n").split(",")
                stu_scores[ans_lst[0]] = 0
                for i in range(1, 26):
                    if i < len(ans_lst):
                        if ans_lst[i] == ans_key_lst[i]:
                            stu_scores[ans_lst[0]] += 4
                        else:
                            if ans_lst[i] == "":
                                skip_count[i] += 1
                            else:
                                incorrect_count[i] += 1
                                stu_scores[ans_lst[0]] -= 1
                    else:
                        skip_count[i] += 1
            
            high_scores_count = 0
            for value in stu_scores.values():
                if value > 80:
                    high_scores_count += 1
            print("Total student of high scores:", high_scores_count)
            print("Average score:", sum(stu_scores.values())/len(stu_scores))
            print("Highest score:", max(stu_scores.values()))
            print("Lowest score:", min(stu_scores.values()))
            print("Range of scores:", max(stu_scores.values()) - min(stu_scores.values() ))
            #Median
            sorted_stu_scores = sorted(stu_scores.values())
            n = len(sorted_stu_scores)
            if n % 2 == 1:
                median = sorted_stu_scores[n//2]
            else:
                median = (sorted_stu_scores[n//2 -1] + sorted_stu_scores[n//2])/2
            print("Median score:", median)
            
            most_skip = [f'{key1} - {value1} - {value1/25}' for key1, value1 in skip_count.items() if value1 == max(skip_count.values())]
            print("Question that most people skip:", ", ".join(most_skip))
            most_incorrect = [f'{key2} - {value2} - {value2/25}' for key2, value2 in incorrect_count.items() if value2 == max(incorrect_count.values())]
            print("Question that most people answer incorrectly:", ", ".join(most_incorrect))
            
            #Task 4:
            with open("score_" + file_name, "w") as score_file:
                lines = []
                for key, value in stu_scores.items():
                    line = key + "," + str(value)
                    lines.append(line)
                score_file.write("\n".join(lines))
            break

if __name__ == "__main__":
    read_file()