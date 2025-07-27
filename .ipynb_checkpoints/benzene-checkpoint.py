import py3Dmol

view = py3Dmol.view(width=500, height=400)
view.addModel("c1ccccc1", "smi")
view.setStyle({"stick": {}})
view.zoomTo()

with open("benzene_view.html", "w") as f:
    f.write(view._make_html())
