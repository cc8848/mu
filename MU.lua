--全民奇迹脚本
--	读取帐号
function read_account()
	file = io.open("/var/mobile/Media/TouchSprite/lua/account.txt","r") 
	ls={};
	account_num = 0;
	for l in file:lines() do
		account_num = account_num + 1 
		ls[account_num] = l
	end
	file:close();
	return account_num ;
end
--	注册封装
function reg_account()
	runApp("com.tianmashikong.qmqj.apps");
	yc(5);
	begin_num = read_account();
	for reg_num = begin_num, 12 do 
		if (isColor( 184,464,0xffff0d, 85) and isColor( 295,464,0xffe804,85)) then --切换帐号
			click(184,464);
			yc(3);
		end
		zt(0x676974,"27|0|0x676974,33|-2|0x686a75,33|-9|0x676974,74|3|0x676974",659,345,899,408,90);--一键注册
		zt( 0x676974,"2|-9|0x676974,-6|-10|0x676974,-6|12|0x676974,2|12|0x6c6e78");--帐号
		for i =0,13 do
			click(900,519,0.05);--删除
		end
		for i =0,13 do
			click(900,519,0.05);--删除帐号
		end
		yc(3);
		Aaccount = "wen"..os.time();
		--	dialog(Aaccount, 1);
		yc(3);
		inp(Aaccount);--输入帐号
		click(860,598,2);--点击密码，下一项
		inp("wenhong");--输入密码
		click(860,598,2);--点击登录
		create_file("account",Aaccount);
		yc(5);
	end
end
--	重新注册
function re_reg()
		zt(0x676974,"27|0|0x676974,33|-2|0x686a75,33|-9|0x676974,74|3|0x676974",659,345,899,408,90);--一键注册
		zt( 0x676974,"2|-9|0x676974,-6|-10|0x676974,-6|12|0x676974,2|12|0x6c6e78");--帐号
		for i =0,13 do
			click(900,519,0.05);--删除
		end
		for i =0,13 do
			click(900,519,0.05);--删除帐号
		end
		yc(3);
		inp(ls[dols + 0]);--输入帐号
		click(860,598,2);--点击密码，下一项
		inp("wenhong");--输入密码
		click(860,598,2);--点击登录
		yc(5);
end
--读取轮数
function read_do_num()
	file = io.open("/var/mobile/Media/TouchSprite/lua/do_num.txt","r") 
	lss={};
	do_num = 0;
	for o in file:lines() do
		do_num = do_num + 1 
		lss[do_num] = o
	end
	file:close();
	return lss[1];
end


function create_file(filename,text,r)
	r = r or "a"
	text = text or ""
	file = io.open("/User/Media/TouchSprite/lua/"..filename..".txt",r)
    file:write(text,"\n"); --将上面保存的剩下所有的内容写入到输出文件
    file:close();
end
--创建空白文件
function create_file_empty(filename)
	file = io.open("/User/Media/TouchSprite/lua/"..filename..".txt","w")
    file:close();
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end
--点击封装
function click(x,y,times,hand)
	times = times or 3;
	hand = hand or 1;
	touchDown (hand,x,y);
	mSleep(100);
	touchUp(hand,x,y);
	yc(times);
end

--延迟封装
function yc(times)
	mSleep(times*1000);
end
--提示封装
function tips(txt,times)
	times = times or 1
	dialog(txt,times);
	yc(3);
end
--[[封装一个单点模糊比色函数--]]
function isColor(x,y,c,s)
    local fl,abs = math.floor,math.abs
    s = fl(0xff*(100-s)*0.01)
    local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
    local rr,gg,bb = getColorRGB(x,y)
    if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
        return true
    end
end
--封装一个多点取色函数
function zt(color,pos,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x0 = x0 or 0;
	y0 = y0 or 0;
	x1 = x1 or 960;
	y1 = y1 or 640;
	x,y = findMultiColorInRegionFuzzy(color,pos,degree,x0,y0,x1,y1);
	if x ~= -1 and y ~= -1 then
		click(x,y);
		return true;
	else
		return false;
	end
end
function zts(color,pos,x0,y0,x1,y1,degree)
	k = 0;
	while k < 1000 do
		degree = degree or 96;
		x0 = x0 or 0;
		y0 = y0 or 0;
		x1 = x1 or 960;
		y1 = y1 or 640;
		x,y = findMultiColorInRegionFuzzy(color,pos,degree,x0,y0,x1,y1);
		if x ~= -1 and y ~= -1 then
			click(x,y)
			--return true;
			break;
		end
		k = k + 1;
		return false;
	end
end
--[[区域找色--]]
function zs(color,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x, y = findColorInRegionFuzzy(color,degree,x0,y0,x1,y1); 
	if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
		click(x,y);
	else                         --如果找不到符合条件的点
		return true;
	end
end
--[[两点找色，区域找色--]]
function zss(color,color2,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x, y = findColorInRegionFuzzy(color,degree,x0,y0,x1,y1);
	x2,y2 =  findColorInRegionFuzzy(color2,degree,x0,y0,x1,y1);
	if x ~= -1 and y ~= -1 and x2 ~= -1 and y2 ~= -1 then  --如果在指定区域找到某点符合条件
		click(x,y);
	else                         --如果找不到符合条件的点
		return true;
	end
end
--[[验证图片--]]
function verify(color,pos,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x0 = x0 or 0;
	y0 = y0 or 0;
	x1 = x1 or 960;
	y1 = y1 or 640;
	x,y = findMultiColorInRegionFuzzy(color,pos,degree,x0,y0,x1,y1);
	if x ~= -1 and y ~= -1 then
		return true;
	else
		return false;
	end
end
--[[验证单点--]]
function verify_one(color,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x0 = x0 or 0;
	y0 = y0 or 0;
	x1 = x1 or 960;
	y1 = y1 or 640;
	x,y = findColorInRegionFuzzy(color,degree,x0,y0,x1,y1);
	if x ~= -1 and y ~= -1 then
		return true;
	else
		return false;
	end
end
--[[验证2点,并点击其中一点--]]
function verify_two(color,color2,x0,y0,x1,y1,degree)
	degree = degree or 96;
	x0 = x0 or 0;
	y0 = y0 or 0;
	x1 = x1 or 960;
	y1 = y1 or 640;
	x,y = findColorInRegionFuzzy(color,degree,x0,y0,x1,y1);
	xa,ya = findColorInRegionFuzzy(color2,degree,x0,y0,x1,y1);
	if x ~= -1 or xa ~= -1 then
		if x ~= -1 then
			click(x,y);
		else
			click(xa,ya);
		end
	else
		return false;
	end
end
--[[封装一个输入函数--]]
function inp(txt)
	inputText(txt);
	yc(1);
end
--[[创建角色--]]
function Create()
	if zt(0x6a6a6b, "6|-1|0x24252c,6|6|0x666666,1|8|0x707070,21|-1|0x646465,22|2|0x626264",25,181,297,472,70) then;--点击0转角色
	else
		zt(0x8f8989, "-2|12|0x7d7777,12|12|0x908a8a,26|12|0x1a1414,25|1|0x130e0e,24|1|0x8f8989");--创建新角色
	end
	--[[如果没有角色，便创建角色魔法师角色--]]
	if verify(0xfff430,"-1|0|0x758114,50|1|0xffa226,81|-2|0xc09817,110|8|0x0f1a01",718,510,885,549) then --如果出现创建角色
		zt(0x5d5b5b,"12|0|0x5f5e5e,6|-1|0x5f5d5d,40|13|0x757575,41|13|0x171212");--点击魔法师
		yc(2);
		zt(0xfff430,"-1|0|0x758114,50|1|0xffa226,81|-2|0xc09817,110|8|0x0f1a01",718,510,885,549);--创建角色
		for i = 0, 5 do
			if verify(0x679718,"0|1|0xbac8ab,35|-2|0xd2d8ca,35|-1|0x263114,35|0|0x5a8d04",510,397,601,428) then --重名了
				zt(0x679718,"0|1|0xbac8ab,35|-2|0xd2d8ca,35|-1|0x263114,35|0|0x5a8d04",510,397,601,428);
				click(635,528);
				zt(0xfff430,"-1|0|0x758114,50|1|0xffa226,81|-2|0xc09817,110|8|0x0f1a01",718,510,885,549);
			end
		end --创建end
	end
	yc(2);
	
end
--[[设置画质为流畅--]]
function fluent()
	click(685,37);
	click(685,196);
	click(646,195);
	click(453,365);
	click(699,147);
end
--领取奖励
function award()
	--查找福利
	while zt(0xe45e1d,"15|-13|0xa74d24,15|-14|0xf7f1f0,-8|15|0xffdf72,15|14|0xc9af5d",501,5,587,69)  do--寻找福利
		yo = 463;
		while zt( 0xab7f12, "14|2|0xf7f0ee,15|3|0xb25823,14|-14|0xf3e5d9,14|-2|0xa35b4b",90,173,144,yo) do--点击左边可领奖项目
			while zt( 0xb3c597, "9|0|0xdee6d1,16|0|0xe7ecdc,18|0|0x4e7702,37|1|0x385c00",671,406,796,453) do--在线领奖
			end
			while zt( 0xd8e4c3, "9|0|0x76a02f,12|0|0x5b8d07,14|0|0xd8e4c3,40|0|0x7ea43d",765,281,922,568) do--登录奖励
			end
			while zt( 0xb8cf90, "1|0|0xecf2e1,10|0|0x80a931,12|0|0xf6f9f0,33|0|0x6c9914",694,409,803,445) do--连续登录奖励
				yc(15);
			end
			yo = yo - 58;--第查一次就少一个项目
		end
	end--寻福利--end
	zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
end
--查找变强
function strong()
	yos = 554
	while zt(0xb17655, "0|1|0x884829,-5|8|0xe4ca6b,5|9|0xffdf72,7|11|0x230909",768,530,839,600) do--点击变强
		while zt( 0xdbe6c4, "19|0|0x5b8f03,24|-2|0xfdfcf8,42|13|0x476702,9|-4|0xa0bd6a",804,218,920,yos) do--点击提升
			---追加
			click(807,232);
			for i = 1,5 do
				if verify_one(0xff0000,346,400,608,455) then--追加
					zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
					break
				else
					click(367,541);
				end
			end
			while zt( 0xd5e2bf, "10|4|0x5d8517,26|4|0xcdd9b6,40|6|0x395d01,42|0|0xd8e5c2") do--提升技能
			end
			if zt(0x365c01, "2|0|0xf8f9f6,17|-8|0xfefffe,32|0|0x385d00,61|-5|0xf4f7ee",650,512,765,552 ) then--自动提升
				yc(5);
			end
			zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
			zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
		end
		yos = yos - 98;
		if yos <= 260 then
			break
		end 
	end
end
--出售背包所有东西
function sale_all()
	for ki = 1,3 do
		xas = 585
		for ln = 1, 5 do
			yas = 170;
			for lns = 1, 4 do
				click(xas,yas,0.5);
				zt( 0x6e9d1f, "1|0|0xffffff,16|0|0x5b8e03,23|-1|0x202c0c,34|11|0x182600");--找击售
				zt( 0x66911f, "1|0|0xfafbf9,3|0|0x548503,16|0|0x324f02,17|0|0x538303");--找使用
				zt( 0x182507, "0|-1|0xa9ada6,0|-2|0xf3f6f2,18|-3|0x568803,17|-3|0x31342c");--找到确定(确定出售)
				yas = yas + 78;
			end
			xas = xas + 78;
		end
		click(871,544);--整理
	end
end
--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end


--[[--启动点--]]
init(0,1);--home-right
::start::
--[[注册12个帐号--]]
--[[查看帐号文件是否存在--]]
if file_exists("/User/Media/TouchSprite/lua/account.txt") then--是否有帐号
else
	create_file_empty("account");--创建一个文件
	
	yc(3);
end
if read_account() < 12 then--如果帐号数量少12则继续创建
	reg_account();
end
--[[查看序例号--]]
for op = 1,2 do
	if file_exists("/User/Media/TouchSprite/lua/do_num.txt") then--查看是否有目前顺序号的文件
		break;
	else
		create_file_empty("do_num");--创建一个文件
		yc(3);
		create_file("do_num","1");
	end
end
tips(read_do_num());
dols = read_do_num();
::dowork::
for mun_mu = 1,(12 - dols) do--12个帐号循环一次
	for work = 1, 4 do--练级4次
		yc(3);
		isfront = isFrontApp("com.tianmashikong.qmqj.apps");
		if isfront == 1 then
			closeApp("com.tianmashikong.qmqj.apps");
		end
		yc(5);
		r = runApp("com.tianmashikong.qmqj.apps");
		yc(60);---mu启动时间iphone4时间特别慢
		if r ~= 0 then
			tips("MU启动失败",60);
		end
		--查找已经登录画面//or 准备登录画面
		if (isColor( 184,464,0xffff0d, 85) and isColor( 295,464,0xffe804,85)) then
			click(184,464);
			yc(20);
		end
		zt(0x6b6d78,"-22|-10|0x686a75,36|-2|0x676974,36|10|0x676974,-22|12|0x6b6d78");--帐号
		yc(2);
		for i =0,13 do
			click(900,519,0.05);--删除帐号
		end
		yc(3);
		inp(ls[dols + 0]);--输入帐号
--		click(900,519,0.05);--删除帐号
		click(860,598,2);--点击密码，下一项
		inp("wenhong");--输入密码
		--[[勾选自动登录--]]
		zt( 0x419bff, "13|0|0xb5b7c2,8|-8|0x5daaff,-16|-1|0xb4b6c1,-4|6|0x007aff",57,233,596,291);--取消自动登录
		zt( 0x419bff, "13|0|0xb5b7c2,8|-8|0x5daaff,-16|-1|0xb4b6c1,-4|6|0x007aff",57,233,596,291);--取消自动登录
		click(860,598,2);--点击登录
		yc(2);
		if verify(0x676974,"27|0|0x676974,33|-2|0x686a75,33|-9|0x676974,74|3|0x676974",659,345,899,408,90) then;
			re_reg();
		end
		zts(0x619c0c,"-57|-10|0xffff0a,7|-10|0xf2f40c,58|-5|0xffd31e,57|-6|0x403706");--进入游戏
		yc(3);
		Create("创建角色");--第一个角色
		yc(5);
		zt(0xc39b0d,"17|-4|0xffff07,65|9|0xe08530,95|13|0xf0b95b");--[[进入游戏--]]
		yc(30);
		zss(0xffffff,0x8db24e,645,418,778,462);--开始征程
		--[[查找有不有xx--]]
		if verify(0xc8b8b1, "21|-5|0x99827a,21|22|0xb77f5c,5|23|0x8a5239") then
			click(x,y);
		end
		zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
		zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
		zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
		fluent();--设置画质为流畅
		yc(1);
		if verify_two(0x05ea02,0xb12710,5,243,200,297,60) then--点击主线任务
			tips("没有找到主线任务");
			zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
		end
		--[[开始练级--]]
		while (true) do --死循环--不停的查找任务
			-- body
			for num =1,500 do --500一轮
				ns = 5
				for n = 1,ns do
					for nk = 1,3 do
						zss(0xededed,0x5a8c03,706,430,821,471);--点击领取奖励
						zss(0xf9fbf6,0x5b8f03,579,508,656,544);--点击佩戴
						zt(0x60910b,"9|0|0xe3ebd5,14|0|0xfbfbfb,30|0|0xe9e9e8,38|3|0x262724");--点击确认按钮
					end
					if n == ns then
						--[[转生--]]
						while verify(0xfbf5dc,"2|-2|0xf5f0d7,7|6|0xf3edd4,11|6|0xfcf6dc,15|6|0xf6f0d7,19|6|0xfbf6dc,20|6|0x141412",82,3,109,18) do
							click(785,292);
							yc(2);
							click(402,384);
							yc(2);
							click(357,417);
							yc(2);
							click(746,540);
							yc(2);
							click(481,482);
							yc(1);
							zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
							tips("转生成功")
							yc(2);
							--[[找XX--]]
						end
						--查找主线任务
						if verify_two(0x05ea02,0xb12710,5,243,200,297,60) then--点击主线任务
							--tips("没有找到主线任务");
							zss(0xededed,0x5a8c03,706,430,821,471);--点击领取奖励
							zss(0xf9fbf6,0x5b8f03,579,508,656,544);--点击佩戴
							zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
							zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
							zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
							zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
						end
					end
					--[[如果出现过场动画则点击跳过去]]
					while (isColor(864,522,0xffd104,85) and isColor( 864,558, 0xffa83e,85) and isColor( 904,540,0xae671e,85)) do
						click(876,538);
						zt(0xeef3e4,"2|0|0xd1e0b7,25|0|0x89af47,32|0|0xd4e2be,35|0|0x61930b",431,309,521,352);--点击佩戴--区域有2点色--第一次带翅膀
						zss(0xfefefe,0x5b8f03,650,512,765,552);--点击自动提升
						yc(10);
						zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
						zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
						zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
					end
					while (isColor( 559,551,0x000000,85) and isColor(579,551,0x000000,85) and isColor(642,562,0x000000,85)) do
						click(884,597,0.2);
					end
					yc(1);
					zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
					zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
					zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
					click(488,302,0.5); --点一下人物
					click(65,266,1);--点一下任务
				end
			end--500--end
			--结束角色的时候到了
			while verify(0xe1d2b1,0xf2e2be,"1|8|0xddcfaf,9|9|0xecdcb9,22|-1|0xf0e0bc,23|-1|0x65655a,24|-1|0x333a36,30|6|0xecddba",3,240,132,258,85) do --[[1转78级]]
				--准备休息,开始清理装备
				tips("1转78级以上啦");
				--[[清理背包--]]
				click(873,99);--点击地图
				click(56,140);--点击世界地图
				click(304,263);--点击冰风谷
				zt(0xe6cab5,"9|-13|0xab9892,-8|14|0x8a5239,9|13|0x7c4633,14|-8|0xaa948b");--点击xx
				--领取奖励
				yc(15);
				award();--领取奖励
				yc(3);
				strong();--变强
				--[[点击背包--]]
				click(707,600);--背包
				zt(0xd2892b,"-10|16|0xf2d872,-7|16|0xc9af5d,4|16|0xf2d872,14|26|0xf29e2f",680,581,743,633);--背包
				for hs = 1,3 do
					zt(0xffffff, "4|0|0xf9fbf5,10|0|0xfefffe,15|0|0xe3ecd2,16|0|0x629103",550,525,653,562);--回收
					click(240,479);--绿装
					click(342,475);--蓝装
					click(452,476);--紫装
					while zt(0x35c129,"5|-9|0x64ff59,6|-8|0x14ff21,8|4|0x196012,11|0|0x14a910",121,132,506,433) do --找绿点
					end
					click(222,534);--立即回收
					zt(0xdfe7d3, "201|129|0xf1f7e4,10|-1|0xd2d9c8,15|0|0x5d8c0a,23|3|0x5c8f03");
					zt(0xdfe7d3, "6|0|0xb4bda6,28|0|0xd6dec9,29|0|0x8d8e8b,37|16|0x0d0f08",359,396,452,428,80);--确定回收
					click(402,411);
				end
				zt(0xf7fbef,"8|0|0xf1f7e4,2|8|0xfefefc,3|9|0x92bf20,17|15|0xf3f6ea",550,525,653,562);--点击取消
				click(871,544);--整理
				yc(5);
				while zt(0x4bff45,"2|-4|0x64ff59,3|-4|0x1bdf21,8|5|0x14a910,5|9|0x196012,0|9|0x2d7c20,0|5|0x12a40f,-3|5|0x35c129",546,131,928,434) do;--找绿点
					zt(0xdce6cb,"-4|8|0xa1bf6b,-3|8|0xd0d3cb,-3|9|0x222e0e,10|7|0xfbfbfa,11|7|0x4d602c",771,380,880,457);--戴装备
				end --带装备
				
				----整理北包
				click(871,544);--整理
				--使用钻石
				while zt(0xd6fcff,"0|1|0x43d7fd,-20|25|0xcfc979,16|0|0x1be9fb",546,131,927,434) do--钻石保价
					click(710,436);
					click(479,456);
				end
				--绑定金币
				while zt( 0xfff063, "0|1|0xc97110,0|2|0xccaf45,1|2|0xf9b946,-17|20|0xcfc979") do--绑金
					zt( 0x66911f, "1|0|0xfafbf9,2|0|0x454b3c,16|0|0x324f02,17|0|0x538303",306,113,798,495);--使用
					zt( 0x47611d, "1|0|0xfbfbf9,2|0|0x454b3b,6|0|0x8fa171,6|-1|0x3d5f02,22|0|0x444d34",249,316,717,494)--批量使用
				end
				--魔晶
				while zt( 0x96a094, "1|0|0x0c1f04,0|16|0x98c085,1|16|0x345b1d,3|25|0x143d01",546,131,927,434) do--魔晶
					zt( 0x66911f, "1|0|0xfafbf9,2|0|0x454b3c,16|0|0x324f02,17|0|0x538303",306,113,798,495);--使用
				end
				--[[清除背包所有东西--]]
				sale_all();
				break;
			end--结束色的时候--end
		end--练级结束
	end--4次循环
	dols = dols + 1;
	if dols < 13 then
		create_file("do_num",dols,"w");
	else
		dols = 1
		create_file("do_num",dols,"w");
	end
end
tips("脚本结束");