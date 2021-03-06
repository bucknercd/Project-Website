from datetime import timedelta

from fastapi import APIRouter#, Body, Depends
#from starlette.exceptions import HTTPException

#from ....core.config import ACCESS_TOKEN_EXPIRE_MINUTES
#from ....core.jwt import create_access_token
#from ....crud.shortcuts import check_free_username_and_email
#from ....crud.user import create_user, get_user_by_email
#from ....db.mongodb import AsyncIOMotorClient, get_database
from ...models.users import UserRegister

router = APIRouter()

@router.post('/users/register/', status_code=201)
async def register(user: UserRegister):
    return user
