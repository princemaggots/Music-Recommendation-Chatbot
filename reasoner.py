import os
import subprocess

# reform into class so I can generate queries
# get information to better supply artists.

# I used the concierge reasoner as a baseline for figuring out how to call subprocess.
def call_reasoner():
    parameters = ['scasp', 'knowledge.lp', 'recommendation.lp', 'requirements.lp', 'query.lp']

    call = subprocess.Popen(
            parameters, stdin=subprocess.PIPE, stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE,
            text=True, universal_newlines=True
            )

    output, _ = call.communicate(timeout=10000)
    outstr = "get_artists("

    if 'BINDINGS' in output:
            output = output[output.find('BINDINGS') + 10:-2].strip()
            output = output[4:len(output)]
            outstr += output
            outstr += ")."
    else:
        outstr += "[])."

    return outstr
    
def generate_query(prompt):
    with open("requirements.lp", 'w') as f:
        f.write('')
        f.write(prompt)

