from fastapi import APIRouter

auth_route = APIRouter(prefix='/auth')

@auth_route.get('/')
async def signup():
    return {
        'status':200,
        'page':'signup'
    }