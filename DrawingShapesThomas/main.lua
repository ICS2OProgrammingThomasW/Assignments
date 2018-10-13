-- Title: Displaying shapes in Lua
-- Name: Thomas Wehbi
-- Course: ICS20
-- this program diplays shapes in Lua
 
-- write locals for the triangle
local triangle 
local textsize = 50 
local triangleText
local triangleX = 200
local triangleY = 250
local verticesTriangle = { 200, 100, 50, 250, 300, 200 }
local triangle = display.newPolygon( triangleX, triangleY, verticesTriangle )

-- set outide of the triangle width
triangle.strokeWidth = 15

-- set outside of the triangle color
triangle:setStrokeColor( 1, 0, 2)

-- set text over the triangle and say "Triangle"
triangleText = display.newText( "Triangle", 200, 350, Arial, textsize)

-- set triangle fill color
triangle:setFillColor(0.2, 0.4, 0.7)
triangleText:setTextColor(75/255, 150/255, 109/255)

-- write locals for the pentogan
local pentogan
local textsizePentogan = 50
local pentoganText
local pentoganX = 694
local pentoganY = 550
local verticesPentogan = { 300, 450, 625, 600, 700, 250, 450, 250, 600, 300 }
local pentogan = display.newPolygon( pentoganX, pentoganY, verticesPentogan )

display.setDefault("background", 50/255, 255/255, 196/255)

-- set outside of the pentogan width 
pentogan.strokeWidth = 15

-- set outside of the pentogan color 
pentogan:setStrokeColor( 3, 2, 1)

-- set text over penogan and say "Pentogan"
pentoganText = display.newText( "pentogan", 625, 700, Arial, textsizePentogan)

--set pentogan fill color 
pentogan:setFillColor( 0.6, 0.4, 0.8)

-- write locals for the polygon
pentoganText:setTextColor( 176/255, 201/255, 19/255)

local quadrilateral
local quadrilateralText
local quadrilateralX = 750
local quadrilateralY = 200
local verticesQuadrilateral = { 330, 515, 160, 600, 160, 515, 270, 420 }
local quadrilateral = display.newPolygon ( quadrilateralX, quadrilateralY, verticesQuadrilateral)

-- set outside of the quadrilateral
quadrilateral.strokeWidth = 15

-- set outside of the quadrilateral color
quadrilateral:setStrokeColor( 0.1, 0.5, 0.3)

-- set text over and say "Quadrilateral"
quadrilateralText = display.newText ( "Quadrilateral", 750, 317, Arial, textsizeQuadrilateral)

-- set quadrilateral fill color
quadrilateral:setFillColor(0.3, 0.9, 0.4)
 
 -- set quadrilateral text color 
 quadrilateralText:setTextColor(98/255, 100/255, 97/255)














