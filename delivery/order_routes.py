from fastapi import APIRouter

order_route = APIRouter(
    prefix='/order'
)

@order_route.get('/')
async def order_root():
    return {
        'status':200,
        'comment':'almost nothing'
    }