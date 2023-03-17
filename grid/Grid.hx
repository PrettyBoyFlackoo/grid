package grid;

class Grid {

    public var cells:Array<Cell> = [];

    public var gridWidth:Float;
    public var gridHeight:Float;
    public var gridSize:Int;
    public var gridX:Float;
    public var gridY:Float;

    var cellSizeX:Float;
    var cellSizeY:Float;

    public function new(width:Float, height:Float, size:Int, x:Float = 0, y:Float = 0) {
        this.gridWidth = width;
        this.gridHeight = height;
        this.gridSize = size;
        this.gridX = x;
        this.gridY = y;

        var cellSize = getDimensionOfCell();
        cellSizeX = cellSize.x;
        cellSizeY = cellSize.y;

        createGrid();
    }

    function createGrid() {
        for (y in 0...gridSize) {
            for (x in 0...gridSize) {

                var cell = new Cell(x, y);

                cells.push(cell);
            }
        }

        ///Calculate Cells
        for (i in cells) {
            var pos = getPosOfCell(i);
            var area = getDimensionOfCell();

            i.setPosition(pos.x, pos.y);
            i.setArea(area.x, area.y);
        }
    }

    function getPosOfCell(cell:Cell):Vec2 {
        var dx = (gridX + cell.i_x * cellSizeX);
        var dy = (gridY + cell.i_y * cellSizeY);

        return new Vec2(dx, dy);
    }

    function getDimensionOfCell():Vec2 {
        var w = gridWidth / gridSize;
        var h = gridHeight / gridSize;

        return new Vec2(w, h);
    }

    public function checkForCellPosition(mouseX:Float, mouseY:Float):Cell {
        for (i in cells) {

            if (mouseX > i.x && mouseX < i.x + i.width && mouseY > i.y && mouseY < i.y + i.height) {
                return i;
            }
        }

        return null;
    }
}