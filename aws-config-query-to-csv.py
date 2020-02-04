import json
import sys
import csv
import re
import boto3
from pathlib import Path
from pprint import pprint

def extractName(e):
    return e["Name"]

def process_sql_file(client, fname_inp):

    ProcessedHeader = False
    fname_tmp = fname_inp.replace('.sql', '.json')
    fname_out = fname_inp.replace('.sql', '.csv')

    sql = ""
    with open(fname_inp, 'r') as file:
        sql = file.read()

    kwargs = {
        'Expression': sql
    }

    csvfile = open(fname_out, 'w', newline="\n", encoding="utf-8") 
    writer = csv.writer(csvfile)

    while True:
        results = client.select_resource_config(**kwargs)
        select_fields = list(map(extractName, results['QueryInfo']['SelectFields']))

        # only write out the header field names once
        if ProcessedHeader == False:
            writer.writerow(select_fields)
            ProcessedHeader = True

        for objstr in results['Results']:
            row = []
            obj = json.loads(objstr)
            for fieldname in select_fields:
                # if the column name is tags it needs to be expanded 
                # if (fieldname == 'tags'):
                    # print(fieldname)
                    # pprint(obj['tags'][10])
                    # evalval = eval("obj['" + fieldname.replace('.',"']['") + "']")
                    # jstr = json.loads(' '.join(map(str, evalval)) )
                    # print(jstr["tag"])

                evalstr = "obj['" + fieldname.replace('.',"']['") + "']"
                try:
                    evalval = eval(evalstr)
                except:
                    evalval = ""
                row.append(evalval)
            writer.writerow(row)

        try: 
            kwargs['NextToken'] = results['NextToken']
        except KeyError:
            break

    csvfile.close()

# Main entry point
if __name__ == '__main__':

    session = boto3.Session()
    client = session.client('config')

    for filename in Path('.').rglob('*.sql'):
        print("I/ Processing %s" % filename)
        try:
            process_sql_file(client, str(filename))
        except:
            print("E/ Error processing %s" % filename)
            raise