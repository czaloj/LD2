#! /usr/local/bin/python
import os
import sys

#BASIC SCRIPT PRESETS
width = 320					# Width of your game in 'true' pixels (ignoring zoom)
height = 240				# Height of your game in 'true' pixels
zoom = 2					# How chunky you want your pixels
src = 'src/'				# Name of the source folder under the project folder (if there is one!)
preloader = 'Preloader'		# Name of the preloader class
flexBuilder = True			# Whether or not to generate a Default.css file
menuState = 'MenuState'		# Name of menu state class
playState = 'PlayState'		# Name of play state class

#Get name of project
if len(sys.argv) <= 1:
	sys.exit(0)
project = sys.argv[1]

#Generate basic game class
filename = project+'/'+src+project+'.as';
try:
	fo = open(filename, 'w')
except IOError:
	print('Can\'t open '+filename+' for writing.')
	sys.exit(0)
lines = []
lines.append('package\n')
lines.append('{\n')
lines.append('\timport org.flixel.*;\n')
lines.append('\t[SWF(width="'+str(width*zoom)+'", height="'+str(height*zoom)+'", backgroundColor="#000000")]\n')
lines.append('\t[Frame(factoryClass="Preloader")]\n')
lines.append('\n')
lines.append('\tpublic class '+project+' extends FlxGame\n')
lines.append('\t{\n')
lines.append('\t\tpublic function '+project+'()\n')
lines.append('\t\t{\n')
lines.append('\t\t\tsuper('+str(width)+','+str(height)+','+menuState+','+str(zoom)+');\n')
lines.append('\t\t}\n')
lines.append('\t}\n')
lines.append('}\n')
fo.writelines(lines)
fo.close()

#Generate preloader
filename = project+'/'+src+preloader+'.as';
try:
	fo = open(filename, 'w')
except IOError:
	print('Can\'t open '+filename+' for writing.')
	sys.exit(0)
lines = []
lines.append('package\n')
lines.append('{\n')
lines.append('\timport org.flixel.system.FlxPreloader;\n')
lines.append('\n')
lines.append('\tpublic class '+preloader+' extends FlxPreloader\n')
lines.append('\t{\n')
lines.append('\t\tpublic function '+preloader+'()\n')
lines.append('\t\t{\n')
lines.append('\t\t\tclassName = "'+project+'";\n')
lines.append('\t\t\tsuper();\n')
lines.append('\t\t}\n')
lines.append('\t}\n')
lines.append('}\n')
fo.writelines(lines)
fo.close()

#Generate Default.css
if flexBuilder:
	filename = project+'/'+src+'Default.css';
	try:
		fo = open(filename, 'w')
	except IOError:
		print('Can\'t open '+filename+' for writing.')
		sys.exit(0)
	fo.write('Add this: "-defaults-css-url Default.css"\nto the project\'s additonal compiler arguments.')
	fo.close()

#Generate game menu
filename = project+'/'+src+menuState+'.as';
try:
	fo = open(filename, 'w')
except IOError:
	print('Can\'t open '+filename+' for writing.')
	sys.exit(0)
lines = []
lines.append('package\n')
lines.append('{\n')
lines.append('\timport org.flixel.*;\n')
lines.append('\n')
lines.append('\tpublic class '+menuState+' extends FlxState\n')
lines.append('\t{\n')
lines.append('\t\toverride public function create():void\n')
lines.append('\t\t{\n')
lines.append('\t\t\tvar t:FlxText;\n')
lines.append('\t\t\tt = new FlxText(0,FlxG.height/2-10,FlxG.width,"'+project+'");\n')
lines.append('\t\t\tt.size = 16;\n')
lines.append('\t\t\tt.alignment = "center";\n')
lines.append('\t\t\tadd(t);\n')
lines.append('\t\t\tt = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");\n')
lines.append('\t\t\tt.alignment = "center";\n')
lines.append('\t\t\tadd(t);\n')
lines.append('\t\t\t\n')
lines.append('\t\t\tFlxG.mouse.show();\n')
lines.append('\t\t}\n')
lines.append('\n')
lines.append('\t\toverride public function update():void\n')
lines.append('\t\t{\n')
lines.append('\t\t\tsuper.update();\n')
lines.append('\n')
lines.append('\t\t\tif(FlxG.mouse.justPressed())\n')
lines.append('\t\t\t{\n')
lines.append('\t\t\t\tFlxG.mouse.hide();\n')
lines.append('\t\t\t\tFlxG.switchState(new PlayState());\n')
lines.append('\t\t\t}\n')
lines.append('\t\t}\n')
lines.append('\t}\n')
lines.append('}\n')
fo.writelines(lines)
fo.close()

#Generate basic game state
filename = project+'/'+src+playState+'.as';
try:
	fo = open(filename, 'w')
except IOError:
	print('Can\'t open '+filename+' for writing.')
	sys.exit(0)
lines = []
lines.append('package\n')
lines.append('{\n')
lines.append('\timport org.flixel.*;\n')
lines.append('\n')
lines.append('\tpublic class '+playState+' extends FlxState\n')
lines.append('\t{\n')
lines.append('\t\toverride public function create():void\n')
lines.append('\t\t{\n')
lines.append('\t\t\tadd(new FlxText(0,0,100,"INSERT GAME HERE"));\n')
lines.append('\t\t}\n')
lines.append('\t}\n')
lines.append('}\n')
fo.writelines(lines)
fo.close()

print('Successfully generated game class, preloader, menu state, and play state.')