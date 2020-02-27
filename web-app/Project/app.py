from fastapi import FastAPI
from starlette.templating import Jinja2Templates
from starlette.requests import Request

app = FastAPI()

templates = Jinja2Templates(directory="templates")


@app.get('/ws/blog')
async def get_blog(request: Request):
    return templates.TemplateResponse("blog.html", {'request' : request})

@app.get('/ws/base.html')
async def get_base(request: Request):
    return templates.TemplateResponse("base.html", {'request': request})
