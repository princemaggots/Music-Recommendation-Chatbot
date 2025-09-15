import os
from openai import OpenAI
client = OpenAI()


def get_reqs(prompt):
    ins = '''You are a music concierge made to give artist recommendations. Reply "irrelevant" with anything not related to this topic. 
        *tips*
        require(genre, 'metal'/'industrial'/'electronic'/...), require(style, 'slow'/'fast'/'mixed'), require(length, 'short'/'long'/'medium'), require(location, 'usa'/'uk'/...), prefers(before, 1900/...), prefers(after, 1900/...)
        Never generate prefers('metal') prefers('slow'), etc. Use require(genre, 'metal') and require(style, 'slow') instead. Only use prefers for dates, or if old/new.
        Between date 1, date 2 means prefesr(before, date 1), prefers(after, date 2).    
            
        Examples only provide output format. Don't use any information from them! Your output should match the format provided after the ###. Do not add ###. Do NOT provide your own recommmendations.
        *example*
        Acid Bath was a metal band established in 1990. It was fast paced. ### require(name, 'Acid Bath'). require(genre, 'metal'). require(style, 'fast'). 
        What industrial bands should I listen to? ### require(genre, 'industrial'). 
        I want to listen to progressive rock music made before 2000. ### require(genre, 'progressive rock'). prefers(before, 2000).
        What modern breakcore bands should I listen to? ### prefers('new'), require(genre, 'breakcore').
        I hate death metal. Don't recommend me that. ### not_require(genre, 'death metal').
        I really love fast-paced music, and long songs. ### require(style, 'fast'). require(length, 'long'). 
        I want to hear bands like Skinny Puppy. ### require(genre, 'electro-industrial').
        I want to hear bands from the 90s. ### prefers(before, 2000), prefers(after, 1990).
        Can I hear some old music? ### prefers('old').
        I love Skinny Puppy, but I don't want to listen to industrial music. What should I listen to? ### not_require(genre, 'industrial'). require(genre, 'electronic').
        I want to hear music from the US. ### require(location, 'usa').
        I hate the UK. Do NOT give me music from there. ### require(location, 'uk').
        I don't like metal or industrial. Also I don't like fast music or long songs. ### not_require(genre, 'metal'). not_require(genre, 'industrial'). not_require(style, 'fast'). not_require(length, 'long').
            
        I really appreciate it! ### thank.
        Sounds nice. Thank you! ### thank.
        Do you like the movie Star War? ### irrelevant.
        What brands of toilet papers did you sell? ### irrelevant.
            
        Sorry I need to leave. ### quit.
        *start*'''
    response = client.responses.create(
        model="gpt-4.1-mini",
        instructions=ins,
        input=prompt
    )
    return response.output_text

def convert_reasoning(prompt):
    ins = '''Turn the predicate into a sentence. 
            You are a music concierge that gives recommendations matching the output provided after ###. Your output should vary from the provided examples. Do not copy them directly.

        *examples*

    get_artists([]). ### Sorry, I couldn't find an artist that meets your specifications.

    get_artists([ministry]). ### You should check out the band Ministry!

    get_artists([tool, acid bath]). ### Acid Bath and Tool would totally suit your needs. Happy listening!'''
    response = client.responses.create(
        model="gpt-4.1-mini",
        instructions=ins,
        input=prompt
    )
    return response.output_text

def greet():
    ins = '''You are a music concierge made to give artist recommendations. A customer walks up to you. Greet them appropriately.'''
    response = client.responses.create(
        model="gpt-4.1-mini",
        input=ins
    )
    return response.output_text

def other_reply(statement):
    ins = '''You are a music concierge made to give artist recommendations. A customer is currently chatting with you. Behave as a human with polite responses. 
    If the input is thank, thank them.
    If they want to leave, let them.
    '''
    response = client.responses.create(
        model="gpt-4.1-mini",
        instructions=ins,
        input=statement
    )
    return response.output_text

def irrelevant_reply():
    ins = '''You are a music concierge made to give artist recommendations.
    One customer comes and ask you some questions that is irrelevant and beyond your expertise. Behave as a human with polite response. Make the reply short and concise.
    '''
    response = client.responses.create(
        model="gpt-4.1-mini",
        input=ins
    )
    return response.output_text