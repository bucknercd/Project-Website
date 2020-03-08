from fastapi import FastAPI
from starlette.templating import Jinja2Templates
from starlette.requests import Request

app = FastAPI()

templates = Jinja2Templates(directory='templates')

@app.get('/')
async def get_index(request: Request):
	return templates.TemplateResponse('index.html', {'request' : request})

@app.get('/blog')
async def get_blog(request: Request):
    return templates.TemplateResponse('blog.html', {'request' : request})

@app.get('/about')
async def get_about(request: Request):
	return templates.TemplateResponse('about.html', {'request' : request})


@app.get('/base')
async def get_base(request: Request):
    return templates.TemplateResponse('base.html', {'request': request})
