init("0", 0); --以当前应用 Home 键在右边初始化

--定义全局变量
--720*1280
sX1,sY1 = 10,10
sX2,sY2 = 710,1270

--打开红包的位置
openX,openY = -1,-1
--红包详细返回按键
descBackX,descBackY = -1,-1


--获取发送的红包坐标
function findRedEnvelope()
	return  findColor(
	{sX1, sY1, sX2, sY2}, 
	{
		{x=0,y=0,color=0xfa9d3b},
		{x=240,y=0,color=0xfa9d3b},
		{x=0,y=60,color=0xfa9d3b},
		{x=240,y=60,color=0xfa9d3b}
	},
	95, 0, 0, 0)
end

--获取开启红包按钮坐标
function findOpenRedEnvelope()
	return  findColor(
	{sX1, sY1, sX2, sY2}, 
	{
		{x=0,y=0,color=0xebcd9a},
		{x=-15,y=0,color=0xebcd9a},
		{x=0,y=15,color=0xebcd9a},
	},
	95, 0, 0, 0)
end

--获取详情页面中返回按键
function findBackFromRedDesc()
	return findColor(
		{sX1, sY1, sX2, sY2}, 
		{
			{x=0,y=0,color=0xebcd9a},
			{x=0,y=1,color=0xebcd9a},
			{x=7,y=-7,color=0xebcd9a},
			{x=7,y=7,color=0xebcd9a},
			{x=16,y=1,color=0xebcd9a},
		},
		95, 0, 0, 0)
end

--点击事件
function tap(x, y)
	sysLog("x:"..x.."y:"..y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0, x, y);
end

--运行脚本
function runScript()
	redX,redY = findRedEnvelope()
	if redX ~= -1 and redY ~= -1 then
		tap(redX,redY)
		mSleep(1000)
		
		if openX < 0 and openY < 0 then
			openX,openY = findOpenRedEnvelope()
		end
		tap(openX,openY)
		mSleep(1000)
		
		if descBackX < 0 and descBackY < 0 then
			descBackX,descBackY = findBackFromRedDesc()
		end
		tap(descBackX,descBackY)
		
	end
end


while(true) do
   runScript()
   mSleep(100)
end
