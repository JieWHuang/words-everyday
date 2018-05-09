# -*- coding: utf-8 -*-
import xdrlib
import sys
import xlrd
import time

# open the xls file


def open_excel(file='words-book/xls/fojiao.xlsx'):
    try:
        data = xlrd.open_workbook(file)
        return data
    except Exception as e:
        print (str(e))

# read the words


def read_excel():
    data = open_excel()
    tableOrdered = data.sheets()[0]
    tableDisordered = data.sheets()[4]
    nrows = tableDisordered.nrows
    colnames = tableDisordered.row_values(0)
    list = []
    for rownum in range(0, nrows):
        row = tableDisordered.row_values(rownum)
        if row:
            app = []
            for i in range(len(colnames)):
                app.append(row[i])
            list.append(app)
    return list

# write words into README.md
# You can set how many words you want to recite everyday


def write_words(tables, wordNum=100):
    today = time.strftime("%Y/%m/%d")
    todayFile = today + ".md"
    print (todayFile)
    for row in tables:
        word = row[0]
        characteristic = row[1]
        discription = row[2]
        readme = open('README.md', 'w', encoding='utf-8')
        print (word)

def tests():
    readme = open('README.md', 'w', encoding='utf-8')
    readme.write('\n| %s | %s | %s |\n' % ("words", "v.", "apple"))

def main():
    # tables = read_excel()
    # write_words(tables)
    tests()




if __name__ == "__main__":
    main()
