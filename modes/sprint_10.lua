local gc=love.graphics
local rnd=math.random
return{
	name={
		"竞速",
		"竞速",
		"Sprint",
	},
	level={
		"10L",
		"10行",
		"10L",
	},
	info={
		"消除10行",
		"消除10行",
		"Clear 10 lines",
	},
	color=color.cyan,
	env={
		drop=60,lock=60,
		target=10,dropPiece=Event.reach_winCheck,
		bg="strap",bgm="race",
	},
	load=function()
		newPlayer(1,340,15)
	end,
	mesDisp=function(P)
		local dx,dy=P.fieldOff.x,P.fieldOff.y
		setFont(55)
		local r=10-P.stat.row
		if r<0 then r=0 end
		mStr(r,-82,265)
		if r<21 and r>0 then
			gc.setLineWidth(4)
			gc.setColor(1,r>10 and 0 or rnd(),.5)
			gc.line(dx,600-30*r+dy,300+dx,600-30*r+dy)
		end
	end,
	score=function(P)return{P.stat.time,P.stat.piece}end,
	scoreDisp=function(D)return toTime(D[1]).."   "..D[2].." Pieces"end,
	comp=function(a,b)return a[1]<b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		if P.stat.row<10 then return end
		local T=P.stat.time
		return 
		T<=7 and 5 or
		T<=10 and 4 or
		T<=25 and 3 or
		T<=40 and 2 or
		T<=60 and 1 or
		0
	end,
}