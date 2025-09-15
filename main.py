# doing basic setup
from chatbot import get_reqs, convert_reasoning, greet, other_reply, irrelevant_reply
from reasoner import call_reasoner, generate_query

print(greet())

chat = True

while (chat):
    response = input()
    chat_response = ""
    output = get_reqs(response)
    if ("require" in output or "prefers" in output):
        generate_query(output)
        reasoner_output = call_reasoner()
        chat_response = convert_reasoning(reasoner_output)
    elif ("irrelevant" in output):
        chat_response = irrelevant_reply()
    else:
        chat_response = other_reply(output)
        if ("quit" in output):
            chat = False

    print(chat_response)

