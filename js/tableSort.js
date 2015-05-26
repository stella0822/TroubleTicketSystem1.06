function sort(tableId, sortColumn,nodeType) {        
	var table = document.getElementById("Searchresult");        
	var tableBody = table.tBodies[0];        
	var tableRows = tableBody.rows;                        
	var rowArray = new Array();        
	for (var i = 0; i < tableRows.length; i++) {            
		rowArray[i] = tableRows[i];        
	}        
	if (table.sortColumn == sortColumn) {            
		rowArray.reverse();        
	} 
	else {            
		rowArray.sort(generateCompareTR(sortColumn, nodeType));        
	}        
	var tbodyFragment = document.createDocumentFragment();        
	for (var i = 0; i < rowArray.length; i++) {            
		tbodyFragment.appendChild(rowArray[i]);        
	}        
	tableBody.appendChild(tbodyFragment);        
	table.sortColumn = sortColumn;    
	}          
function generateCompareTR(sortColumn, nodeType) {        
	return function compareTR(trLeft, trRight) {            
		var leftValue = convert(trLeft.cells[sortColumn].firstChild.nodeValue, nodeType);     
		var rightValue = convert(trRight.cells[sortColumn].firstChild.nodeValue, nodeType);            
		if (leftValue < rightValue) {                
			return -1;            
		} 
		else {                
			if (leftValue > rightValue) {                    
				return 1;                
			} 
			else {                    
				return 0;                
			}            
		}        
	};    
	}          
	function convert(value, dataType) {        
		switch (dataType) {          
		case "int":            
			return parseInt(value);          
		case "float":            
			return parseFloat(value);          
		case "date":            
			return new Date(Date.parse(value));          
		default:            
			return value.toString();        
				}    
	}  