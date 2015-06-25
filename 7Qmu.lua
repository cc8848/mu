---全民奇迹脚本
function main()--主程
	init("com.tianmashikong.qmqj.apps",1)--home键在右
	luaExitIfCall(true)--来电停止脚本

	myjson=
	[[{
	"style":"default","views":
	[
	{
		"type":"Label",
		"text":"7Q全民奇迹辅助",
		"size":24,
		"align":"center",
		"color":":250,75,0"
	},
	{
		"type":"Label",
		"text":"1.是否在游戏中",
		"size":16,
		"align":"left",
		"color":"122,91,62"
	},
	{
		"type":"RadioGroup",
		"list":"是,否",
		"select":"0"
	},
	{
		"type":"Label",
		"text":"2.请输入您要登录的账号",
		"size":16,
		"align":"left",
		"color":"122,91,62"
	},
	{
		"type":"Edit",
		"prompt":"",
		"text":"1",
		"size":16,
		"align":"center",
		"color":"31,31,31"
	},
	{
		"type":"Label",
		"text":"3.请选择功能",
		"size":16,
		"align":"left",
		"color":"122,91,62"
	},
	{
		"type":"RadioGroup",
		"list":"自动任务",
		"select":"0"
	}
	]
	}]]

	--a为确认取消，b为是否游戏中，c为账号序号，d为功能选择
	uia,uib,uic,uid=showUI(myjson)

	if uia==0 then--如果ui按了取消
		lua_exit()
	else
		if uib=="0" then--如果是在游戏中
			gnxz()
		else
			closeApp("com.tianmashikong.qmqj.apps")
			mSleep( 2 * 1000)
			runApp("com.tianmashikong.qmqj.apps")
			mSleep(28 * 1000)
			dl()
			while true do
				if jm_cjjs() then
					dj( 802,  528)--点击创建角色
					break
				else
					dj( 476,  529)--点击进入游戏
					break
				end
			end
			gnxz()
		end
	end
end
function gnxz()--3.功能选择
	if uid=="0" then
		gn_zdrw()
	end
end
function gn_zdrw()--0.自动任务
	time1=os.time()
	time2=os.time()
	time3=os.time()
	time4=os.time()
	time5=os.time()
	time6=os.time()
	time7=os.time()
	time8=os.time()
	time9=os.time()
	time10=os.time()
	function kszc()--开始征程按钮
		local x,y = findMultiColorInRegionFuzzy( 0x5d9104, "4|23|0x375c00,106|0|0x5c8f03,104|18|0x305700", 80, 636, 408, 786, 461)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function lqjl()--领取奖励按钮
		local x,y = findMultiColorInRegionFuzzy( 0x5a8c03, "44|21|0x516a00,98|4|0x5b8e03", 80, 701, 428, 816, 468)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function z()--任务追踪 [主]
		local x,y = findMultiColorInRegionFuzzy( 0xedbd0f, "-10|10|0xf0be0f,0|9|0xf8c50d,10|6|0xfac60d,10|12|0xfac60d", 70, 3, 240, 27, 258)
		if x~=-1 and y~=-1 then
			dj(x+50,y+15)
		end
	end
	function pd()--新装备佩戴
		local x,y = findMultiColorInRegionFuzzy( 0x5b8f03, "0|23|0x3e6000,53|19|0x335900,53|5|0x609504", 80, 572, 504, 656, 543)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function tg()--跳过按钮
		local x,y = findMultiColorInRegionFuzzy( 0xefbd17, "22|18|0xc86f34,-43|8|0xdd9627", 75, 748, 507, 911, 573)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function cb()--人物~翅膀~佩戴
		local x,y = findMultiColorInRegionFuzzy( 0x5a8d03, "33|-1|0x5d9103,67|28|0x3a5e00", 80, 403, 290, 526, 359)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function clx()--关闭人物对话框
		if gc( 929,   81, 0xe6cab5 ) then
			dj(929,   81)
		end
	end
	function qr01()--完成 X章 XXXX 确认按钮
		local x,y = findMultiColorInRegionFuzzy( 0x598c03, "1|16|0x355b00,75|4|0x5b8e03,78|16|0x345a00", 80, 396, 428, 556, 482)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function dhk01()--对话文本，右下角点击手指
		local x,y = findMultiColorInRegionFuzzy( 0x564e3e, "-14|-3|0x7a6757,4|-6|0x473b2d,11|1|0x1b1813", 80, 446, 516, 501, 553)
		if x~=-1 and y~=-1 then
			dj(736,  579)
		end
	end
	function newico()--新图标出现
		if gc(  440,  243, 0x0e0c0b ) or gc(  584,  308, 0x7e602e ) or gc(  598,  392, 0x835214 ) then
			dj(481,  296)
			dj(481,  296)
		end
	end
	function z1()--任务追踪主线任务，判断物为左箭头
		local x,y = findMultiColorInRegionFuzzy( 0xffe67b, "-7|6|0xffcf5d,5|16|0x000000", 85, 173, 206, 212, 242)
		if x~=-1 and y~=-1 then
			dj(x-100,y+40)
		end
	end
	function zs01()--转生文字按钮
		local x,y = findMultiColorInRegionFuzzy( 0xf7f700, "2|5|0xe9e900,2|15|0xfdfd00,21|12|0xf1f100,17|4|0xfdfd00,24|1|0xfbfb00", 80, 329, 401, 388, 430)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function zs02()--转生绿色大按钮
		local x,y = findMultiColorInRegionFuzzy( 0x6faf0e, "-38|13|0x3f6803,38|-2|0x69a70a", 80, 623, 508, 861, 564)
		if x~=-1 and y~=-1 then
			dj(x,y)
		end
	end
	function zs03()--转生成功确定按钮
		local x,y = findMultiColorInRegionFuzzy( 0x66a20a, "-92|17|0x3c6302,-140|5|0x5b4e43,53|3|0x292420,-104|-4|0x659d07", 80, 332, 426, 618, 522)
		if x~=-1 and y~=-1 then
			--dialog("转生成功确定",1)
			dj(x,y)
		end
	end
	function bagfull()--背包已满的处理功能
		dj(870,  541)--点击整理
		while true do
			ms()
			local x1,y1 = findMultiColorInRegionFuzzy( 0x13b913, "-1|-1|0x10c515,1|0|0x13b913,3|1|0x13b011,-1|5|0x108207", 75, 536, 128, 936, 439)--背包内可穿装备绿色箭头
			if x1~=-1 and y1~=-1 then
				dj(x1+60,y1-30)--点击后面一件装备，否则无法穿戴
				dj(823,  540)--回收
				if gc(  407,  408, 0x5e9204 ) and gc(429,  399, 0x5e9204) and gc(472,  239, 0xf39408) and gc(585,  404, 0x5e9204 ) then--如果是紫装
					dj(366,  363)--点击本次登陆不再提示
					dj(407,  408)--确定
				end
				ms()
				dj(x1+20,y1-20)--点击可穿戴装备
				local x2,y2 = findMultiColorInRegionFuzzy( 0xf3f7ed, "15|0|0xf2f5ec,18|2|0x5a8d03,25|1|0xe8ebe1,33|6|0xe7eae3", 80, 751, 374, 869, 452)--点开可穿戴装备按佩戴
				if x2~=-1 and y2~=-1 then
					dj(x2,y2)
				end
			else
				break
			end
			ms()
		end
		dj(601,  543)--回收
		dj(242,  479)--绿装
		dj(339,  483)--蓝装
		dj(444,  476)--紫装
		dj(217,  528)--立即回收
		if gc( 522, 238,0x44110e ) then
			dj(404, 408)--确认回收
		end
	end
	function mxxl()
		local x,y = findMultiColorInRegionFuzzy( 0xeab54c, "18|6|0xd09539,43|15|0xa8641b,61|14|0xac691e,90|8|0xc68932", 80, 403, 116, 554, 160)--冥想修炼领取
		if x~=-1 and y~=-1 then
			dj(605,  366)--点击免费领取1倍奖励
			dj(749,  112)--关闭冥想修炼
		end
	end

	z()

	while true do
		local x0,y0 = findMultiColorInRegionFuzzy( 0x775131, "11|-3|0x554e3c,29|7|0xe1dee4,28|31|0xfdd343",80, 717, 236, 840, 324)--背包已满闪烁图标
		if x0~=-1 and y0~=-1 then
			dj(x0,y0)
			bagfull()
		end
		kszc()
		lqjl()
		pd()
		tg()
		cb()
		if gc(  480,  416, 0x947e54 ) then
			qr01()
		end
		dhk01()
		newico()
		zs01()
		zs02()
		zs03()
		if gc(  748,  111, 0xe6cab5 ) then
			mxxl()
		end

		time2=os.time()
		if time2-time1>=15 then--超过一定时间按主线任务1
			time1=os.time()
			z()
		end
		time4=os.time()
		if time4-time3>=30 then--超过一定时间关闭人物对话框
			time3=os.time()
			clx()
		end
		time6=os.time()
		if time6-time5>=30 then--超过一定时间按主线任务2
			time5=os.time()
			z1()
		end
		if gc(927, 81, 0xe8cebc) then--转生界面，超过时间即关闭
			time8=os.time()
			if time8-time7>=10 then
				time7=os.time()
				dj(928,   82)
			end
		end
		time10=os.time()
		if time10-time9>=180 then
			time9=os.time()
			dj(  707,  608)--点击背包
			bagfull()
		end
	end
end
function dl()--账号输入
	while true do
		if gc(  457,  155, 0xda1518 ) and gc(  894,   29, 0x0073ff ) then--确认为账号输入界面
			ms()
			uic=tonumber(uic)
			readList()
			id=lua_string_split(ls[uic], "|")

			if gc(90,  452, 0x007aff) then--记住密码
				dj(90,452)
			elseif gc(400,  452, 0x007aff) then--自动登录
				dj(400,  452)
			end

			dj(445,305)--帐号
			inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			ms()
			inputText(id[1])
			dj(387,  192)--密码
			inputText(id[2])
			dj(779,  110)--登录

			while  an_jryx() do
				dj(722,469)
			end
			break
		end
	end
end
function readList()--打开id.txt并读取
	file = io.open("/User/Media/TouchSprite/lua/id.txt","r")
	ls={}
	i=0
	for l in file:lines() do
		i=i+1
		ls[i]=l
	end
	file:close()
end
function ms()--延迟
	mSleep(math.random(1000,1500))
end
function gc(x,y,z)--单点取色
	if getColor(x,y)==z then
		return true
	else
		return false
	end
end
function dj(x,y)--普通点击
	ms()
	touchDown(0,x+math.random(-5,5), y)
	mSleep(math.random(5,10))
	touchUp(0,x+math.random(-5,5), y)
	ms()
end
function lua_string_split(str, split_char)--分割函数
	local sub_str_tab = {};
	while (true) do
		local pos = string.find(str, split_char);
		if (not pos) then
			sub_str_tab[#sub_str_tab + 1] = str;
			break;
		end
		local sub_str = string.sub(str, 1, pos - 1);
		sub_str_tab[#sub_str_tab + 1] = sub_str;
		str = string.sub(str, pos + 1, #str);
	end
	return sub_str_tab;
end
function an_jryx()--进入游戏按钮
	local x,y = findMultiColorInRegionFuzzy( 0x6eae0e, "3|20|0x546f00,-43|4|0xfeb12d,55|8|0xcd7730", 85, 615, 426, 844, 513)
	if x~=-1 and y~=-1 then
		return true
	else
		return false
	end
end
function jm_cjjs()--需要创建角色的界面
	if gc(  645,  533, 0x4e0507 ) and gc(  806,  153, 0x141213 ) and gc(  125,  520, 0xe3c239 ) then--判断是否创建角色界面
		return true
	else
		return false
	end
end
main()