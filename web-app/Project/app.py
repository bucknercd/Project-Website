from fastapi import FastAPI
from starlette.templating import Jinja2Templates
from starlette.requests import Request

app = FastAPI()

templates = Jinja2Templates(directory="templates")


@app.get('/web-server/blog')
async def get_blog(request: Request):
    return templates.TemplateResponse("blog.html", {'request' : request})
