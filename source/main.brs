sub main()
  ' Create Canvas Component
  canvas = CreateObject("roImageCanvas")

  ' Background Orange
  canvas.setLayer(0, { color: "#884400" })

  ' Rectangle Shape
  newShapeLocation = { x: 300, y:200, w:200, h:100 }
  canvas.setLayer(10, { color: "#00BB00", targetRect: newShapeLocation })

  ' Text
  newTextAttributes = {
    color: "#0000CC"
    font: "Large"
    Halign: "Hcenter"
    Valign: "VCenter"
  }
  canvas.setLayer(5, {
    text: "Roku",
    textAttrs: newTextAttributes,
    targetRect:{
      x: 200, y:200, w:200, h: 100
    }
  })

  ' Rectangle Shapes by Iteration
  colors = [ "#AA0000", "#0000AA", "#A0A0A0", "#F0F0F0" ]
  shapeLocation = { x: 100, y: 100 }
  shapeSize = { w: 400, h: 300 }
  for i = 0 to colors.count() -1
    c = colors[i]
    shapeLocation.x = shapeLocation.x + 25
    shapeLocation.y = shapeLocation.y + 25
    shapeSize["w"] = shapeSize["w"] - 50
    heightVar = "h"
    shapeSize[heightVar] = shapeSize[heightVar] - 50
    print "--- Addding Shape ---"
    print shapeLocation
    print shapeSize
    canvas.setLayer(1+i, {
      color: c,
      targetRect: shapeSize,
      targetTranslation: shapeLocation
    })
  end for

  ' Show Canvas
  canvas.show()

  print "*** CANVAS SHOWN ***"
  sleep(5000)
end sub
