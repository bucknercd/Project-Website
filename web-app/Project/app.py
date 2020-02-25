from fastapi import FastAPI

app = FastAPI()

@app.get('/blog')
async def blog():
    return {'blog': 'web-app blog'}
