(* ::Package:: *)

SetDirectory[NotebookDirectory[]];
<<data.m;
Needs["ErrorBarPlots`"];
experimental\[LetterSpace]balmer\[LetterSpace]series = {412.6,435.6,487.8,658};
theoretical\[LetterSpace]balmer\[LetterSpace]series = {410.2,434.1,486.1,656.3};
difference\[LetterSpace]list = {experimental\[LetterSpace]balmer\[LetterSpace]series,-(theoretical\[LetterSpace]balmer\[LetterSpace]series - experimental\[LetterSpace]balmer\[LetterSpace]series)}\[Transpose];
data = {{435.6`,1.5`},{487.8`,1.6999999999999886`},{658,1.7000000000000455`}};
data2 = {412.6`,2.400000000000034`};
errors  = {{.2,.2},{.2,.2},{.2,.2}};
erlist = {data,errors}\[Transpose];
plotlist2  ={{{412.6,2.4},ErrorBar[.2,.2]}};
plotlist = {#1,ErrorBar[Sequence@@#2]} &@@@  erlist;
weights = 1/(#1^2+#2^2)&@@@ errors;
fitmodel = NonlinearModelFit[data,0*x+b,{a,b},x,
Weights->weights];
failmodel =  NonlinearModelFit[data,a*x+b,{a,b},x,
Weights->weights];

calibimg=Show[

Plot[{fitmodel[x],failmodel[x]} ,{x,Min@data[[All,1]],Max@data[[All,1]]},ImageSize -> 600,FrameTicksStyle-> 13,PlotRange -> All,
PlotLegends->Placed[{"\[CapitalDelta]\[Lambda]=1.63","\[CapitalDelta]\[Lambda]=0.0007\[Lambda]+1.2756"},Scaled[{.74,.60}]],
PlotStyle ->{{Thickness-> 0.005,RGBColor[0.368417,0.506779,0.709798]},{Thickness-> 0.003,RGBColor[0.368417,0.506779,0.709798],Dashed}},Frame -> {True,True,True,True},AxesOrigin-> {400,1.3},FrameLabel->{Style["\[Lambda], nm",FontFamily->"Tahoma",FontSize->14,Black],Style["\[CapitalDelta]\[Lambda], nm",FontFamily->"Tahoma",FontSize->14,Black]}],


ErrorListPlot[plotlist, PlotStyle->{AbsolutePointSize[10],AbsoluteThickness[1.5]}, PlotRange -> All],

ErrorListPlot[plotlist2,PlotStyle->{AbsolutePointSize[6],AbsoluteThickness[.8],Red},
PlotLegends->Placed[{"\:0412\:0456\:0434\:043a\:0438\:043d\:0443\:0442\:0430 \:0442\:043e\:0447\:043a\:0430"},Scaled[{.75,.7}]]]]


Clear[data,weights,errors,erlist,data2,plotlist,plotlist2,difference\[LetterSpace]list];
fitresults = fitmodel[{"BestFit","BestFitParameters","ParameterTable","ParameterErrors"}]






(* ::Input:: *)
(*Export["img\\calib.pdf",calibimg];*)


(* ::Input:: *)
(**)
