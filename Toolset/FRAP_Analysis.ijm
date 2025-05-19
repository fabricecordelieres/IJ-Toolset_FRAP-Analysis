//Modifiers' codes
var leftButton=16;
var rightButton=4;
var shift=1;
var ctrl=2; 
var alt=8;

//Colors for graphs
var colors=newArray("blue", "cyan", "darkGray", "gray", "green", "lightGray", "magenta", "orange", "pink", "red", "white", "yellow");


//Handle problem with Windows 10
var File_separator="/";


//-------------------------------------------------------------------------------------
macro "Add reference ROIs Action Tool - C410Da7CeefC44fD70D73De0De3C1f5D8dDdcCfefD16D38C99fD71D72De1De2Cf55Da4Db4Cf1eD39C9fbD8eCfffD09D28D43D54CdfeDafDbfDd9Cf00D85C88fD61D62Df1Df2C7b5Dc7CfefD2aD3aCf8fD08D33Cd86Db6Cf4eD34CfaaD8aCfeeD77Da5C930D8bC55fD80D83D90D93Da0Da3Db0Dc0Dd0Dd3C3f6Dd7CaafD60D63Df0Df3Cf0eD14Cf4eD07D18D19CebaD99CdfeDecCf33D6aD6bDd5C6f9DddCfafD46Cf7aD58Cf7fD23D56CfccD86Dc5CfffD5bDb5C380Db7C54fDb3C1f5DbeCf77D68D94D95Cf3eD29D44D45CafcDebCf11D67C4f8DcdCf9fD24Cf88D69Cf7fD05D49CfbbD5aCfeeD7aCa30Dc6C3f7DceCf1eD48CcfdDd8CefeD7dDccCf44Dc4C8faDe7CfcfD04D13D17Cea9D9bCf8fD47CfccD97CfffDdeDe6C670Da8C9fbDdaCf11D9aC4f7De8De9Ce98DaaCf5eD06CfbbD59C850Dd6CebaD98C6f9DdbDeaCf99Dd4C681Da9C54fDc3C2f6D9eDaeCbfbD7cCf22D76CfafD15D55Cf88D66CfcbDa6Ce10D7bC4f7D8cCf4bD57CcfdD9dCfaaD75CfddD84"{
	checkForPlugin("Metamorph nd file builder...", "Metamorph Companion", "https://github.com/fabricecordelieres/IJ-Plugin_Metamorph-Companion/releases/download/v1.1/MM_Companion.jar");
	answers=GUI(true, true, false);
	getAllRois(answers[0], answers[1]);
	run("Close All");
}

//-------------------------------------------------------------------------------------
macro "Perform analysis Action Tool - C211D0fCbaaD18C533D1fCfbbD2bD93Da3Db3C555D00D01D02D03D04D05D06D07D08D09D0aD2fD3fD4fD5fD6fD7fD8fD9fDafDbfDcfDdfDefDffCf88D27D53Cf55D28D29CfeeD55C544D0bD0cCbbbD10D11D12D13D14D15D16D17D2eD3eD4eD5eD6eD7eD8eD9eDaeDbeDceDdeDeeDfeCc11D1cCfddD62D64Dd3Cf99D35Cf77D73Dc2CfffD2dD39Dd1De1Df1C644D0dCfbbDc3Cf66D44De2Df2CfeeD34D43Cf44D36CfddD26D2cDe3Df3CfaaD72D83Cf88D2aD82D92Da2Db2C733D0eCf66Dd2Cc44D1eCb55D1aCfccD38D46Cf77D37Cf55D54Cf44D45D63Cb22D1bCe33D1dCb88D19"{
	checkForPlugin("ResultsTable To GraphPad Prism", "ResultsTable To GraphPad Prism", "https://github.com/fabricecordelieres/IJ-Plugin_ResultsTable-To-GraphPad-Prism/releases/download/v1.0/ResultsTable_To_GraphPad_Prism.jar");
	run("Set Measurements...", "  redirect=None decimal=9");
	
	answers=GUI(true, true, true);
	processAllDatasets(answers[0], answers[1], answers[2], answers[3]);
	run("Close All");
}

//-------------------------------------------------------------------------------------
macro "Get graphs & data Action Tool - N66C000C07aDa1Cfc2CfffC220C7acCfc3C17aD1eD2dD2eD3cD3dD3eD4bD4cD4dD5aD5bD5cD69D6aD6bD78D79D7aD88D89D98Db4Dc3Dc4Dd2Dd3Dd4De1De2De3C17bD74Cfc2Ca81CfeaCfd4C06aD84C17aDb7Cfd2C27aCcddCfd3C48bCfd2DdeDeeCfc1CdedCfd6C179DcbDdaDdbDe9DeaC07bD1aD28D29C17aD9bDaaDabDb9DbaDbbDc7Dc8Dc9DcaDd7Dd8Dd9De6De7De8CacdCfd3D9eDaeDbeDceC38bD0bDb0Cfc1CfecCfe5C17aD4eD5dD6cD7bD8aD8bD99D9aDa4Da8Da9Db8De4De5C17bD19D1bD2aD38D39D47D48D57D73D81Db1C37aCbdeD63D64Cfd4C59bD8cCffdCfe8DadDbdC169DebC17aD0cD1cD1dD2bD2cD3aD3bD49D4aD58D59D68Db2Db3Dc0Dc1Dc2Dd1C971C9bdCfd3C38aCeb1CffbCfd5C07aD91C17aD0dD67D77D87D97Da7Dd0Dd5CcdeCfd3C49cD27Da0CffdCfe7CbddD6eC38bD0eDe0Cfc1CffcCfd5C37aCceeD65Cfd4D8eC7acD9cDacDbcDccDdcCdefD08Cfe9D9dC046D82Da3C750C8bdC27aD5eCc91CfebCfd4CcddC49bD75D95Da5CffcCfe6CacdD76D86D96Da6Db6C38bDc5CcdeD17D62C7acDecCffeCfe8C279C9cdC38bCfc1CcdeD7dC59cCfe8DcdDddDedCbdeD66D80C48bDb5CdeeCffeCfeaD7eC012D92C8bcC18bD37D72CeedCfd6C5acD0aC9cdDc6Cec1CeffD26C057Da2C970C8bdC28aD7cDd6Ceb1Cfd5CbdeD46D56Cfd7C48bD6dCceeD36C6adD71D90Cfe9CacdC39bD85CfffD61C000D93C035D83CffcD8dC058D94C8cdD09C39cD18CfffD70Bf0C000C07aCfc2D5eD6dD7cD8bD9aCfffC220C7acD0cCfc3C17aD01D02D11C17bCfc2DadCa81CfeaD66D76D97Cfd4DabC06aC17aCfd2D3eD4dD4eD5cD5dD6bD6cD7aD7bD88D89D8aD99C27aD33D34D35D36D37CcddD47D48D49Cfd3D3dC48bCfd2D0eD1eD2eD5bD67D68D69D6aD77D78D79Cfc1D6eD7dD7eD8cD8dD8eD9bD9cD9dD9eCdedD4aCfd6DaaC179D08D09D17D18D26D27C07bC17aD05D06D07D14D15D16D23D24D25CacdCfd3C38bCfc1CfecCfe5C17aD03D04D12D13D22C17bC37aD2bCbdeCfd4D98DaeC59bCffdD86Da8Cfe8C169D0aD0bD19D1aD1bD28D29D2aC17aC971C9bdD3bCfd3DacC38aD32Ceb1CffbD56Cfd5D4cD59C07aC17aCcdeD43D44D45Cfd3C49cCffdCfe7D1dCbddC38bCfc1CffcCfd5D57D58C37aD3aCceeD20Cfd4D87C7acCdefCfe9C046C750C8bdD10C27aCc91CfebD4bCfd4D5aCcddD46C49bCffcD3cCfe6D2dCacdC38bCcdeC7acCffeCfe8C279D38D39C9cdD31C38bCfc1CcdeD2cC59cD00Cfe8D0dCbdeC48bCdeeD42CffeCfeaC012C8bcD1cC18bCeedCfd6C5acC9cdCec1CeffC057C970C8bdC28aD21Ceb1Cfd5CbdeCfd7C48bCceeC6adCfe9Da9CacdC39bCfffC000C035CffcC058C8cdC39cCfffB0fC000D17C07aCfc2D22D31D33D40D43D53D73CfffD3aD49C220D18C7acCfc3C17aC17bCfc2Ca81D08CfeaCfd4D0aD83C06aC17aCfd2D02D11D12D20D21D30C27aCcddCfd3C48bCfd2D00D01D03D10D13D23Cfc1D32D36D37D38D41D42D50D51D52D60D61D62D63D70D71D80CdedCfd6C179C07bC17aCacdCfd3C38bCfc1D72D81D90D91CfecCfe5C17aC17bC37aCbdeCfd4D92C59bCffdCfe8C169C17aC971D07C9bdCfd3C38aCeb1D26CffbD04D14D24D34D46D47Cfd5D05D15C07aC17aCcdeCfd3C49cCffdCfe7CbddC38bCfc1D29CffcD44D48D54D64Cfd5Da0C37aCceeCfd4C7acCdefCfe9C046C750D27C8bdC27aCc91D16CfebD2aCfd4CcddC49bCffcD45D74D93Cfe6CacdC38bCcdeC7acCffeDa2Cfe8C279C9cdC38bCfc1D09D82CcdeC59cCfe8CbdeC48bCdeeCffeD84CfeaC012C8bcC18bCeedCfd6D1aC5acC9cdCec1D06CeffC057C970D28C8bdC28aCeb1D19Cfd5D25D35CbdeCfd7D39C48bCceeC6adCfe9Da1CacdC39bCfffC000C035CffcC058C8cdC39cCfffNf0C000C07aCfc2Da9Db8Db9Dc7Dc8Dd6Dd7DdaDe6CfffC220C7acCfc3DcaC17aD10D11D20C17bCfc2Ca81CfeaCfd4DbaC06aC17aCfd2D98D99Da7Da8Db6Db7Dc6C27aCcddCfd3D89DeaC48bD51D52D53Cfd2D85D86D87D88D94D95D96D97Da3Da4Da5Da6Db2Db3Db4Db5Dc0Dc1Dc2Dc3Dc5Dd0Dd1Dd2De0De1De2Cfc1Dc9Dd8Dd9De7De8De9CdedCfd6C179C07bC17aD32D33D41D42D43CacdD34Cfd3D75D80D81D82D83D90D91D92Da0Da1Db0C38bCfc1CfecD61D62D63Cfe5D70C17aD21D22D30D31D40C17bC37aCbdeCfd4Dc4C59bCffdD68Cfe8C169C17aC971C9bdCfd3D76D77D84D93Da2Db1Dd3De3C38aD23Ceb1CffbDe4Cfd5Dd5De5C07aC17aCcdeCfd3D71D72D73D74C49cCffdD8aCfe7CbddC38bCfc1CffcD64D65D66D67Cfd5DaaC37aCceeCfd4D78C7acCdefCfe9C046C750C8bdC27aCc91CfebDd4Cfd4CcddC49bCffcCfe6CacdC38bD50CcdeC7acCffeCfe8D9aC279C9cdC38bD12Cfc1CcdeC59cD00Cfe8CbdeD54C48bCdeeD02D24CffeCfeaD79C012C8bcC18bCeedD60Cfd6C5acC9cdCec1CeffC057C970C8bdD01C28aCeb1Cfd5CbdeCfd7C48bCceeC6adCfe9CacdD13D44C39bCfffC000C035CffcC058C8cdC39cCfff"{
	checkForPlugin("Zip it", "Zip It", "https://github.com/fabricecordelieres/IJ-Plugin_Zip-It/releases/download/v1.0/Zip_It.jar");

	answers=GUI(false, true, false);
	zipIt(answers[1]);
	
	//Launch the colab script
	showMessage("Next step: data compilation with Python", "A web browser window will pop-up\nwith the Google Colab script to compile the data:\nfollow the instructions.");
	exec("open", "https://colab.research.google.com/github/fabricecordelieres/Colab-FRAP_Script/blob/main/FRAP_analysis.ipynb");
}



//-------------------------------------------------------------------------------------
function GUIOld(askIn, askOut, askParameters){
	in="";
	out="";
	nPreBleach=4;

	if(askIn){
		in=getDirectory("Where are the files ? (upper directory)");
		in=replace(in, "\\", "/");
	}
	if(askOut){
		out=getDirectory("Where to save the files ?");
		out=replace(out, "\\", "/");
	}
	if(askParameters) nPreBleach=getNumber("Number of pre-bleach timepoints to average for normalisation", nPreBleach);
	
	return newArray(in, out, nPreBleach);
}

//-------------------------------------------------------------------------------------
function GUI(askIn, askOut, askParameters){
	in="";
	out="";
	nPreBleach=4;
	ch=1;
	
	Dialog.create("FRAP Analysis");

	if(askIn) Dialog.addDirectory("Select the input folder", in);
	if(askOut) Dialog.addDirectory("Select the output folder", out);
	if(askParameters){
		Dialog.addNumber("Number of pre-bleach timepoints to average for normalisation", nPreBleach);
		Dialog.addSlider("Channel for quantification", 1, 5, ch);
	}
	
	Dialog.show();
	
	if(askIn) in=Dialog.getString();
	if(askOut) out=Dialog.getString();
	if(askParameters){
		nPreBleach=Dialog.getNumber();
		ch=Dialog.getNumber();
	}
	
	if(!endsWith(in, File.separator)) in+=File.separator;
	if(!endsWith(out, File.separator)) out+=File.separator;
	
	return newArray(in, out, nPreBleach, ch);
}

//-------------------------------------------------------------------------------------
function getAllRois(in, out){
	ndFiles=getSpecificFilesList(in, ".nd");
	firstCell=true;

	for(i=0; i<ndFiles.length; i++){
		subOut=out+replace(ndFiles[i], ".nd", File_separator);
		File.makeDirectory(subOut);
		
		rgnFile=in+replace(ndFiles[i], ".nd", ".rgn");
		if(File.exists(rgnFile)){
			if(firstCell){
				showMessage("Info", "In the next window, when ask to draw a ROI:\nshift+click: increase radius\nalt+click: decrease radius\nspace: validate\nNB: move the mouse when changing the radius ;-)\nAll infos will be reminded in the status bar");
				firstCell=false;
	
			}
			appendReferenceROI(in+ndFiles[i], subOut);
		}
	}

}

//-------------------------------------------------------------------------------------
function processAllDatasets(in, out, nPreBleach, channel){
	folders=getFoldersList(out);

	for(i=0; i<folders.length; i++){
		subOut=out+folders[i];
		basename=replace(folders[i], File_separator, "");

		rgnFile=in+basename+".rgn";
		if(File.exists(rgnFile)) buildAndAnalyse(in+basename+".nd", subOut, nPreBleach, channel);
	}

}

//-------------------------------------------------------------------------------------
function appendReferenceROI(ndFile, out){
	run("Close All");
	roiManager("Reset");
	basename=replace(File.getName(ndFile), ".nd", "");
	folder=File.getParent(ndFile);


	parseNd(ndFile);
	run("Metamorph rgn file to RoiManager...", "select=["+folder+File_separator+basename+".rgn"+"]");
	run("Metamorph nd file builder...", "input=["+ndFile+"] build_all_channels start_timepoint=1 stop_timepoint=1 show_built_stack(s) save/show_mode=[All channels together]");
	roiManager("Show All");
	
	waitForUser("Delete unrelevant ROIs\nthen click Ok");
	
	//Get the average radius
	radius=0;
	for(i=0; i<roiManager("Count"); i++){
		roiManager("Select", i);
		getBoundingRect(x, y, width, height);
		radius+=width+height;
	}
	radius/=(4*roiManager("Count"));
	
	getReferenceROI("Background_Roi", radius, "blue");
	wait(500);
	getReferenceROI("Signal_Reference_Roi", radius, "red");

	roiManager("Deselect");
	roiManager("Save", out+basename+"_ROIs.zip");
}

//-------------------------------------------------------------------------------------
function buildAndAnalyse(ndFile, out, nPreBleach, channel){
	//Load image data
	run("Close All");
	basename=replace(File.getName(ndFile), ".nd", "");
	folder=File.getParent(ndFile);
	run("Metamorph nd file builder...", "input=["+ndFile+"] build_all_channels build_all_timepoints show_built_stack(s) save/show_mode=[All channels together]");
	saveAs("ZIP", out+basename+"_Hyperstack.zip");
	
	//Read the timestamps
	wave=getSignalChannel();

	times=readTimes(wave);
	run("Clear Results");
	for(i=0; i<times.length; i++) setResult("Time_sec", i, times[i]);

	//Load the ROIs
	roiManager("Reset");
	roiManager("Open", out+basename+"_ROIs.zip");

	//Quantify
	Stack.setChannel(wave);
	getDimensions(width, height, channels, slices, frames);
	for(i=1; i<=frames; i++){
		Stack.setFrame(i);

		//Raw data
		for(j=0; j<roiManager("Count"); j++){
			roiManager("Select", j);
			if(channel<=channels) Stack.setChannel(channel);
			getStatistics(area, mean, min, max, std, histogram);
			setResult(Roi.getName, (i-1), mean);
		}
	}
	run("ResultsTable To GraphPad Prism", "where="+out+basename+"_Quantif_Raw.pzfx");
	saveAs("Results", out+basename+"_Quantif_Raw.xls");
	
	//Plot raw
	run("Plots...", "width=1024 height=256 font=12 draw draw_ticks minimum=0 maximum=0 interpolate");
	roiManager("Select", 0);
	legend=Roi.getName;
	dataMin=65536;
	dataMax=0;
	for(i=0; i<roiManager("Count")-2; i++){
		roiManager("Select", i);
		name=Roi.getName;
		data=newArray(0);
		for(j=0; j<nResults; j++) data=Array.concat(data, getResult(name, j));
		if(i==0){
			Plot.create("FRAP Data, Raw", "Time(sec)", "Raw intensity (AU)", times, data);
		}else{
			legend+="\t"+name;
			Plot.setColor(colors[i%colors.length]);
			Plot.add("line", times, data);
		}
	}
	Plot.setLegend(legend, "top-right");
	Plot.setLimitsToFit();
	Plot.show();
	saveAs("Jpeg", out+basename+"_Graph_Raw.jpg");


	//Normalisation
	

	//Compute normalised values
	for(i=0; i<roiManager("Count")-2; i++){
		roiManager("Select", i);
		name=Roi.getName;

		//Avg prebleach
		avgPreBleachRoi=0;
		avgPreBleachBkgd=0;
		avgPreBleachRef=0;
		for(j=0; j<nPreBleach; j++){
			avgPreBleachRoi+=getResult(name, j);
			avgPreBleachBkgd+=getResult("Background_Roi", j);
			avgPreBleachRef+=getResult("Signal_Reference_Roi", j);
		}
		avgPreBleachRoi/=nPreBleach;
		avgPreBleachBkgd/=nPreBleach;
		avgPreBleachRef/=nPreBleach;

		for(j=0; j<nResults; j++){
			rawValue=getResult(name, j);
			bkgdValue=getResult("Background_Roi", j);
			refValue=getResult("Signal_Reference_Roi", j);

			normValue=((rawValue-bkgdValue)/(refValue-bkgdValue))/((avgPreBleachRoi-avgPreBleachBkgd)/(avgPreBleachRef-avgPreBleachBkgd));
			setResult(name, j, 100*normValue);
		}
		
		//Table.applyMacro(name+"=100*(("+name+"-Background_Roi)/(Signal_Reference_Roi-Background_Roi))/"+((avgPreBleachRoi-avgPreBleachBkgd)/(avgPreBleachRef-avgPreBleachBkgd)));  !!! Pb d'arrondi !!!

		//Full scale normalisation
		data=newArray(nResults);
		for(j=0; j<data.length; j++){
			data[j]=getResult(name, j);
		}
		//Table.getColumn(name);

		//Get the mean in pre-bleach
		pre=Array.slice(data,0,nPreBleach-1);
		Array.getStatistics(pre, min, max, mean, stdDev);		

		//Get the min in post-bleach
		min=data[nPreBleach];

		for(j=0; j<data.length; j++){
			if(j<nPreBleach){
				setResult("Full_Scale_"+name, j, data[j]);
			}else{
				setResult("Full_Scale_"+name, j, 100*(data[j]-min)/(mean-min));
			}
		}
		
		//Table.applyMacro("Full_Scale_"+name+"=100*("+name+"-"+min+")/"+(mean-min)); !!! Pb d'arrondi !!!
		
	}
	run("ResultsTable To GraphPad Prism", "where=["+out+basename+"_Quantif_Norm.pzfx]");
	saveAs("Results", out+basename+"_Quantif_Norm.xls");
	
	//Plot double normalised values 
	for(i=0; i<roiManager("Count")-2; i++){
		roiManager("Select", i);
		name=Roi.getName;
		data=newArray(0);
		data=Table.getColumn(name);
		if(i==0){
			Plot.create("FRAP Data, Double Normalised", "Time(sec)", "Raw intensity (AU)", times, data);
		}else{
			legend+="\t"+name;
			Plot.setColor(colors[i%colors.length]);
			Plot.add("line", times, data);
		}
	}
	Plot.setLegend(legend, "top-right");
	Plot.setLimitsToFit();
	Plot.show();
	saveAs("Jpeg", out+basename+"_Graph_Double_Norm.jpg");

	//Plot full scale normalised values 
	for(i=0; i<roiManager("Count")-2; i++){
		roiManager("Select", i);
		name=Roi.getName;
		data=newArray(0);
		data=Table.getColumn("Full_Scale_"+name);
		if(i==0){
			Plot.create("FRAP Data, Full Scale Normalised", "Time(sec)", "Raw intensity (AU)", times, data);
		}else{
			legend+="\t"+name;
			Plot.setColor(colors[i%colors.length]);
			Plot.add("line", times, data);
		}
	}
	Plot.setLegend(legend, "top-right");
	Plot.setLimitsToFit();
	Plot.show();
	saveAs("Jpeg", out+basename+"_Graph_Full_Scale_Norm.jpg");
}

//-------------------------------------------------------------------------------------
function getReferenceROI(name, radius, color){
	x=-1; y=-1; modifiers=-1;
	x2=-1; y2=-1; modifiers2=-1;

	minDim=minOf(getWidth(), getHeight())/2;
	
	while(!isKeyDown("space")){
		getCursorLoc(x, y, z, modifiers);
		if (x!=x2 || y!=y2 || modifiers!= modifiers2 || isKeyDown("shift") || isKeyDown("alt")) {
			showStatus("Draw the "+name+": shift+click: + rad.; alt+click: - rad.; space: validate");
			if(modifiers&leftButton!=0 && modifiers&shift!=0) radius++;
			if(modifiers&leftButton!=0 && modifiers&alt!=0) radius--;
			if(radius>minDim) initialRadius =minDim;
			if(radius <0) radius=1;
			makeOval(x-radius, y-radius, 2*radius, 2*radius);
			
		}
		x2=x; y2=y; modifiers2=modifiers;
    		wait(10);
	}
	Roi.setName(name);
	Roi.setStrokeColor(color);
	roiManager("Add");
	roiManager("Select", roiManager("Count")-1);
	roiManager("Remove Channel Info");
	roiManager("Remove Slice Info");
	roiManager("Remove Frame Info");
}

//-------------------------------------------------------------------------------------
function readTimes(wave){
	List.clear();
	getDimensions(width, height, channels, slices, frames);
	
	//Get the timepoints
	times=newArray(frames);
	Stack.setChannel(wave);

	for(i=1; i<=frames; i++){
		Stack.setFrame(i);
		times[i-1]=extractAcquisitionTimeInSec();
	}

	t0=times[0];
	for(i=0; i<frames; i++) times[i]-=t0;

	setBatchMode(false);
	return times;
}

//-------------------------------------------------------------------------------------
function parseNd(ndFile){
	List.clear();
	nd=File.openAsString(ndFile);
	ndLines=split(nd,"\n");
	for(i=0; i<ndLines.length; i++) parseNdLine(ndLines[i]);
}

//-------------------------------------------------------------------------------------
function parseNdLine(line){
	line=replace(line, "\"", "");
	fields=split(line, ",");
	
	if(fields.length==2) List.set(fields[0], substring(fields[1], 1));
}

//-------------------------------------------------------------------------------------
function getSignalChannel(){
	//Get channel with images acquired for all timepoints
	getDimensions(width, height, channels, slices, frames);
	wave=1;
	for(i=1; i<=channels; i++){
		Stack.setChannel(i);
		allTimePointsAcquired=true;
		for(j=1; j<=frames; j++){
			Stack.setFrame(j);
			getStatistics(area, mean, min, max, std, histogram);
			if(mean==0){
				allTimePointsAcquired=false;
				j=frames;
			}
		}
		if(allTimePointsAcquired){
			wave=i;
			i=channels;
		}
	}
	return wave;
}

//-------------------------------------------------------------------------------------
function extractMetadata(){
	infoField=getImageInfo();
	infoLines=split(infoField, "\n");
	for(i=0; i<infoLines.length; i++) parseInfoLine(infoLines[i]);
}

//-------------------------------------------------------------------------------------
function parseInfoLine(line){
	line=replace(line, "<prop ", "");
	line= replace(line, "/>", "");
	fields=split(line, "=\"");
	
	if(fields.length!=0){
		if(fields[0]=="id" && fields.length==6) List.set(fields[1], fields[5]);
	}
}

//-------------------------------------------------------------------------------------
function extractAcquisitionTimeInSec(){
	extractMetadata();
	timeString=List.get("acquisition-time-local");
	tmp=split(timeString, " ");
	HHMMSS=split(tmp[1], ":");
	
	return 3600*parseInt(HHMMSS[0])+60*parseInt(HHMMSS[1])+parseFloat(HHMMSS[2]);
}

//-------------------------------------------------------------------------------------
function getSpecificFilesList(dir, ext){
	tmp=getFileList(dir);
	filesList=newArray(0);

	for(i=0; i<tmp.length; i++) if(endsWith(tmp[i], ext)) filesList=Array.concat(filesList, tmp[i]);

	return filesList;
}

//-------------------------------------------------------------------------------------
function getFoldersList(dir){
	tmp=getFileList(dir);
	filesList=newArray(0);

	for(i=0; i<tmp.length; i++) if(endsWith(tmp[i], File_separator)) filesList=Array.concat(filesList, tmp[i]);

	return filesList;
}

//-------------------------------------------------------------------------------------
function arrayToString(array, separator){
	out=""+array[0];

	for(i=1; i<array.length; i++) out+=", "+array[i];

	return out;
}

//-------------------------------------------------------------------------------------
function zipIt(dir){
	datasets=getFoldersList(dir);
	zipFolder=dir+"_toZip"+File.separator;
	File.makeDirectory(zipFolder);
	
	for(i=0; i<datasets.length; i++){
		if(datasets[i]!="_toZip"+File.separator){
			xlsFile=replace(datasets[i], File.separator, "_Quantif_Norm.xls");
			if(File.exists(dir+datasets[i]+xlsFile)){
				File.copy(dir+datasets[i]+xlsFile, zipFolder+xlsFile);
			}
		}
	}
	run("Zip it", "input_folder=["+zipFolder+"] output_folder=["+dir+"] zip_filename=_DataToUpload.zip remove_input_folder");
}

//----------------------------------------------------------------------
function checkForPlugin(menuName, pluginName, URL){
	List.setCommands;
	if(List.get(menuName)==""){
		waitForUser("The "+pluginName+" plugin is missing\nand will be downloaded.\nIn the next window, simply\nclick on \"Save\" button to install it.");
		open(URL);
		showStatus(pluginName+" downloaded");
	}else{
		showStatus("Check for "+pluginName+" passed");
	}
}
