--------------------------------------------------------------------------------
-- Godly Trail effect                                               by DragShot
--------------------------------------------------------------------------------
-- Dependencies: Psych-XT, ds_utils.lua
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
local scriptName = string.sub(debug.getinfo(1).source, 2);
function _pathSplice(limit)
	local path, idx = scriptName, 0;
	for i = 1, limit do idx,_ = string.find(path, '/', idx + 1, true); end
	return string.sub(path, 1, idx);
end
local libDir = _pathSplice(2)..'scripts/';

require(libDir..'ds_utils');
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Internals
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function table.indexof(tbl, elem)
	for idx, item in ipairs(tbl) do
		if (item == elem) then
			return idx;
		end
	end
	return false;
end

ScaleTween = { --global
	_tweens = {}
};
ScaleTween._mt = { __index = ScaleTween };

function ScaleTween.new(tag, secs, targetScaleX, targetScaleY)
	targetScaleY = targetScaleY or targetScaleX;
	local tween = {};
	setmetatable(tween, ScaleTween._mt);
	tween.target = tag;
	tween.secs = secs;
	tween.targetScaleX = targetScaleX;
	tween.targetScaleY = targetScaleY;
	tween.baseScaleX = getProperty(tag..'.scale.x');
	tween.baseScaleY = getProperty(tag..'.scale.y');
	tween.time = 0;
	tween.resetting = false;
	return tween;
end

function ScaleTween.update(elapsed)
	local toRemove = {};
	for idx, tween in ipairs(ScaleTween._tweens) do
		local finished = tween:_update(elapsed);
		if (finished) then table.insert(toRemove, tween) end;
	end
	for idx, tween in ipairs(toRemove) do
		tween:stop();
	end
end

function ScaleTween._update(self, elapsed)
	self.time = self.time + elapsed;
	local finished = false;
	local scale = 0;
	scale = self.time / self.secs;
	if (scale >= 1.0) then scale = 1.0; finished = true; end
	scaleX = self.baseScaleX + ((self.targetScaleX - self.baseScaleX) * scale);
	scaleY = self.baseScaleY + ((self.targetScaleY - self.baseScaleY) * scale);
	setProperty(self.target..'.scale.x', scaleX);
	setProperty(self.target..'.scale.y', scaleY);
	--scaleObject(self.target, scale, scale);
	return finished;
end

function ScaleTween.start(self)
	local idx = table.indexof(ScaleTween._tweens, self);
	if not (idx) then
		table.insert(ScaleTween._tweens, self);
	end
	return self;
end

function ScaleTween.stop(self)
	local idx = table.indexof(ScaleTween._tweens, self);
	if (idx) then
		table.remove(ScaleTween._tweens, idx);
	end
	return self;
end

GodTrail = {}; --[global class]
GodTrail._mt = { __index = GodTrail };

function GodTrail.new(target, delay, alpha, tween, secs, blendMode)
	local obj = {};
	setmetatable(obj, GodTrail._mt);
	obj.curTime = 0;
	obj.enabled = false;
	obj.target = target or 'boyfriend';
	obj.delay = math.max(0, delay or 0.2);
	obj.alpha = math.max(0, alpha or 0.4);
	obj.tween = { x = 0, y = 0, scaleX = 0.0, scaleY = 0.0 };
	if (tween.x) then obj.tween.x = tween.x end;
	if (tween.y) then obj.tween.y = tween.y end;
	if (tween.scaleX) then obj.tween.scaleX = tween.scaleX end;
	if (tween.scaleY) then obj.tween.scaleY = tween.scaleY end;
	obj.time = secs;
	obj.stcolor = nil;
	obj.color = nil;
	obj.nghosts = 0;
	obj.blendMode = blendMode or 'normal';
	obj.href = PropertyRef:new(obj.target);
	return obj;
end

function GodTrail:update(elapsed)
	self.curTime = self.curTime + elapsed;
	if (self.delay < self.curTime) then
		self.curTime = self.curTime - self.delay;
		self.stcolor = GodTrail.getStockColor(self.target); --Making sure this is up-to-date
		if (self.enabled) then
			self:makeTrailFrame();
		end
	end
end

function GodTrail:setEnabled(enabled)
	self.enabled = enabled;
end

function GodTrail:makeTrailFrame()
	local order = getObjectOrder(self.target..'Group') - 1;
	--debugPrint('makeTrailFrame('..self.target..') order: '..tostring(order));
	local href = self.href;
	if (href['imageFile'] ~= '') then
		self.nghosts = self.nghosts + 1;
		local sprName = 'GodTrail:'..self.target..':'..self.nghosts;
		makeAnimatedLuaSprite(sprName, href['imageFile'], href['x'], href['y']);
		setProperty(sprName .. '.offset.x', href['offset.x']);
		setProperty(sprName .. '.offset.y', href['offset.y']);
		setProperty(sprName .. '.scale.x', href['scale.x']);
		setProperty(sprName .. '.scale.y', href['scale.y']);
		setProperty(sprName .. '.flipX', href['flipX']);
		setProperty(sprName .. '.flipY', href['flipY']);
		setProperty(sprName .. '.antialiasing', href['antialiasing']);
		setProperty(sprName .. '.alpha', self.alpha);
		if (self.color) then
			setProperty(sprName .. '.color', self.color);
		elseif (self.stcolor) then
			setProperty(sprName .. '.color', self.stcolor);
		end
		local px, py = href['x'], href['y'];
		local sx, sy = href['scale.x'], href['scale.y'];
		doTweenX(sprName..':scrollX', sprName, px + self.tween.x, self.time, 'linear');
		doTweenY(sprName..':scrollY', sprName, py + self.tween.y, self.time, 'linear');
		ScaleTween.new(sprName, self.time, sx + (sx * self.tween.scaleX), sy + (sy * self.tween.scaleY)):start();
		doTweenAlpha(sprName..':scrollA', sprName, 0.0, self.time, 'linear', function() removeLuaSprite(sprName, true); end);
		setScrollFactor(sprName, href['scrollFactor.x'], href['scrollFactor.x']);
		setObjectOrder(sprName, order);
		setBlendMode(sprName, self.blendMode);
		addAnimationByPrefix(sprName, 'default', href['animation.frameName'], 1, false);
		playAnim(sprName, 'default');
		addLuaSprite(sprName, false);
	end
end

function GodTrail.getStockColor(target) --[static]
	local color = nil;
	if (target == 'gf') then
		color = getColorFromHex('A5004D'); --Fetched manually from json
	elseif (isAny(target, 'boyfriend', 'dad')) then
		color = getColorFromHex(getCharacterColor(target));
	end
	return color;
end
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Callbacks
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
local trails = {
	bf = nil,
	dad = nil,
	gf = nil
};

local targets = { 'bf', 'gf', 'dad' };

--You may set your default preferences here
local defs = {
	delay = 0.075,
	alpha = 0.6,
	tween = { x = 40, y = -100, scaleX = 0.85, scaleY = 0.25 },
	secs = 0.50,
	blendMode = 'add'
}

function sparkTrail(target)
	if (trails[target] == nil) then
		trails[target] = GodTrail.new((target == 'bf') and 'boyfriend' or target, defs.delay, defs.alpha, defs.tween, defs.secs, defs.blendMode);
	end
end

function onUpdate(elapsed)
	ScaleTween.update(elapsed);
end

function onUpdatePost(elapsed)
	for i = 1,#targets,1 do
		local trail = trails[targets[i]];
		if (trail ~= nil) then
			trail:update(elapsed);
		end
	end
end

function onEvent(name, value1, value2)
	if (name == 'Toggle Godly Trail') then
		local chars = value1:split(',', true);
		for i = 1,#chars,1 do
			if (isAny(chars[i], 'bf', 'gf', 'dad') and value2:len() > 0) then
				sparkTrail(chars[i]);
				trails[chars[i]]:setEnabled(isAny(value2, 'on', '1', 'true'));
			end
		end
	elseif (name == 'Set Trail Params') then
		local chars = value1:split(',', true);
		for i = 1,#chars,1 do
			if (isAny(chars[i], 'bf', 'gf', 'dad') and value2:len() > 0) then
				sparkTrail(chars[i]);
				local props = readParams('trail{'..value2..'}');
				local obj = trails[chars[i]];
				if (props.delay) then obj.delay = math.max(0, props.delay) end;
				if (props.delay) then obj.alpha = math.max(0, props.alpha) end;
				if (props.tweenX) then obj.tween.x = props.tweenX end;
				if (props.tweenY) then obj.tween.y = props.tweenY end;
				if (props.scaleX) then obj.tween.scaleX = props.scaleX end;
				if (props.scaleY) then obj.tween.scaleY = props.scaleY end;
				if (props.secs) then obj.time = props.secs end;
				if (props.color) then obj.color = getColorFromHex(props.color) end;
				if (props.blend) then obj.blendMode = props.blend end;
			end
		end
	elseif (name == 'Set Trail Blend') then
		local chars = value1:split(',', true);
		for i = 1,#chars,1 do
			if (isAny(chars[i], 'bf', 'gf', 'dad') and value2:len() > 0) then
				sparkTrail(chars[i]);
				trails[chars[i]].blendMode = value2;
			end
		end
	elseif (name == 'Set Trail Color') then
		local chars = value1:split(',', true);
		for i = 1,#chars,1 do
			if (isAny(chars[i], 'bf', 'gf', 'dad')) then --table.unpack(targets) --broken?
				sparkTrail(chars[i]);
				if (value2:len() == 0 or value2 == 'null' or value2 == 'nil') then
					trails[chars[i]].color = nil;
				else
					trails[chars[i]].color = getColorFromHex(value2);
				end
			end
		end
	end
end