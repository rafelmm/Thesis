<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="tf_conversores_DC_DC">
<description>Conversores DC DC</description>
<packages>
<package name="SOT223">
<description>&lt;b&gt;SOT-223&lt;/b&gt;</description>
<wire x1="3.277" y1="1.778" x2="3.277" y2="-1.778" width="0.1998" layer="21"/>
<wire x1="3.277" y1="-1.778" x2="-3.277" y2="-1.778" width="0.1998" layer="21"/>
<wire x1="-3.277" y1="-1.778" x2="-3.277" y2="1.778" width="0.1998" layer="21"/>
<wire x1="-3.277" y1="1.778" x2="3.277" y2="1.778" width="0.1998" layer="21"/>
<smd name="1" x="-2.311" y="-3.099" dx="1.219" dy="2.235" layer="1"/>
<smd name="2" x="0" y="-3.099" dx="1.219" dy="2.235" layer="1"/>
<smd name="3" x="2.311" y="-3.099" dx="1.219" dy="2.235" layer="1"/>
<smd name="4" x="0" y="3.099" dx="3.6" dy="2.2" layer="1"/>
<text x="1.905" y="2.54" size="0.8128" layer="21" ratio="12">4</text>
<text x="-2.54" y="0.0508" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.3208" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
</package>
<package name="DD-3">
<description>&lt;b&gt;DPAC&lt;/b&gt;</description>
<wire x1="-5.398" y1="-4.445" x2="-5.084" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-5.084" y1="-4.445" x2="5.076" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="5.076" y1="-4.445" x2="5.398" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="5.398" y1="-4.445" x2="5.398" y2="4.128" width="0.1524" layer="21"/>
<wire x1="5.398" y1="4.128" x2="-5.398" y2="4.128" width="0.1524" layer="21"/>
<wire x1="-5.398" y1="4.128" x2="-5.398" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-5.084" y1="3.81" x2="5.076" y2="3.81" width="0.1524" layer="21"/>
<wire x1="5.076" y1="3.81" x2="5.076" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-5.084" y1="-4.445" x2="-5.084" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-5.398" y1="4.128" x2="-5.084" y2="3.81" width="0.1524" layer="21"/>
<wire x1="5.398" y1="4.128" x2="5.076" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-5.398" y1="4.128" x2="-5.398" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-5.398" y1="5.08" x2="-4.445" y2="5.715" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="5.715" x2="4.445" y2="5.715" width="0.1524" layer="21"/>
<wire x1="4.445" y1="5.715" x2="5.398" y2="5.08" width="0.1524" layer="21"/>
<wire x1="5.398" y1="5.08" x2="5.398" y2="4.128" width="0.1524" layer="21"/>
<smd name="1" x="-2.54" y="-7.9375" dx="1.27" dy="5.08" layer="1"/>
<smd name="2" x="0" y="-7.9375" dx="1.27" dy="5.08" layer="1"/>
<smd name="3" x="2.54" y="-7.9375" dx="1.27" dy="5.08" layer="1"/>
<text x="-3.81" y="-10.795" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-2.54" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.175" y1="-9.525" x2="-1.905" y2="-4.445" layer="51"/>
<rectangle x1="-0.635" y1="-9.525" x2="0.635" y2="-4.445" layer="51"/>
<rectangle x1="1.905" y1="-9.525" x2="3.175" y2="-4.445" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="REG1117">
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-7.62" width="0.4064" layer="94"/>
<text x="-7.62" y="5.715" size="1.778" layer="95" ratio="10">&gt;NAME</text>
<text x="1.016" y="-10.16" size="1.778" layer="96" ratio="10">&gt;VALUE</text>
<pin name="VIN" x="-12.7" y="0" visible="pad" length="middle" direction="in"/>
<pin name="VOUT" x="12.7" y="0" visible="pad" length="middle" rot="R180"/>
<pin name="GND" x="0" y="-12.7" visible="pad" length="middle" rot="R90"/>
<pin name="VO2" x="12.7" y="-5.08" visible="pad" length="middle" rot="R180"/>
<text x="-6.604" y="-0.762" size="1.778" layer="97">Vin</text>
<text x="6.858" y="-4.826" size="1.778" layer="97" rot="R90">Vout</text>
<text x="5.08" y="-5.08" size="1.778" layer="97" rot="R180">GND/ADJ</text>
</symbol>
<symbol name="LM2937">
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<text x="7.62" y="7.62" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IN" x="-12.7" y="2.54" length="middle" direction="in"/>
<pin name="OUT" x="12.7" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="GND" x="12.7" y="-2.54" length="middle" direction="pwr" rot="R180"/>
</symbol>
<symbol name="GND">
<text x="1.27" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<pin name="GND@" x="0" y="0" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="REG1117" prefix="U">
<description>&lt;b&gt;800mA and 1A Low Dropout (LDO) Positive Regulator&lt;/b&gt;&lt;p&gt;
1.8V, 2.5V, 2.85V, 3.3V, 5V, and Adj</description>
<gates>
<gate name="G$1" symbol="REG1117" x="0" y="0"/>
</gates>
<devices>
<device name="F" package="DD-3">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="TEXAS INSTRUMENTS" constant="no"/>
<attribute name="MPN" value="REG1117FAKTTT" constant="no"/>
<attribute name="OC_FARNELL" value="1296120" constant="no"/>
</technology>
<technology name="3.3">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="TLV1117-33CDCY" constant="no"/>
<attribute name="OC_FARNELL" value="1494942" constant="no"/>
<attribute name="OC_RS" value="660-7975" constant="no"/>
</technology>
</technologies>
</device>
<device name="" package="SOT223">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VO2" pad="4"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
</connects>
<technologies>
<technology name=""/>
<technology name="3.3">
<attribute name="MPN" value="TLV1117-33CDCY" constant="no"/>
<attribute name="OC_FARNELL" value="1494942" constant="no"/>
<attribute name="OC_RS" value="660-7975" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM2937IMP-*" prefix="IC">
<description>&lt;font color="red"&gt;&lt;h2&gt;
 400 and 500 mA Low Dropout Voltage Regulator
	&lt;/h2&gt;&lt;/font&gt;&lt;font color="blue"&gt;&lt;h1&gt;
NATIONAL SEMICONDUCTOR
	&lt;/h1&gt;&lt;hr&gt;&lt;/font&gt;&lt;p&gt;&lt;author&gt;created by &lt;a href="mailto:Reter.Hofmann@ph-tronic.de"&gt;Peter.Hofmann@ph-tronic.de&lt;/a&gt;&lt;/author&gt; &lt;p&gt;  
10-2004 Rev.0
	&lt;hr&gt;
&lt;a href="http://http://www.ti.com/lit/ds/symlink/lm2937.pdf"&gt;Datasheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="LM2937" x="0" y="0"/>
<gate name="P" symbol="GND" x="25.4" y="0" addlevel="request"/>
</gates>
<devices>
<device name="" package="SOT223">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
<connect gate="P" pin="GND@" pad="4"/>
</connects>
<technologies>
<technology name="10">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
<technology name="12">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
<technology name="15">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
<technology name="2.5">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
<technology name="3.3">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
<technology name="5.0">
<attribute name="MPN" value="LM2937IMP-5.0" constant="no"/>
<attribute name="OC_FARNELL" value="1798318" constant="no"/>
<attribute name="OC_RS" value="761-5609" constant="no"/>
</technology>
<technology name="8.0">
<attribute name="OC_FARNELL" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
<symbol name="A3L-LOC">
<wire x1="288.29" y1="3.81" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="3.81" x2="373.38" y2="3.81" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="383.54" y2="3.81" width="0.1016" layer="94"/>
<wire x1="383.54" y1="3.81" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="383.54" y1="8.89" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="383.54" y1="13.97" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="383.54" y1="19.05" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="3.81" x2="288.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="24.13" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="342.265" y1="24.13" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="373.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="342.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="342.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<text x="344.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="344.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="357.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="343.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="387.35" y2="260.35" columns="8" rows="5" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="A3L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A3, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A3L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_atmel">
<description>Micontroladores</description>
<packages>
<package name="TQFP144">
<description>&lt;b&gt;QFP144&lt;/b&gt;&lt;p&gt;
shrink quad flat pack, square (smd-ipc)</description>
<wire x1="-9.91" y1="-9.91" x2="9.91" y2="-9.91" width="0.2032" layer="51"/>
<wire x1="9.91" y1="-9.91" x2="9.91" y2="9.91" width="0.2032" layer="51"/>
<wire x1="9.91" y1="9.91" x2="-9.91" y2="9.91" width="0.2032" layer="51"/>
<wire x1="-9.91" y1="9.91" x2="-9.91" y2="-9.91" width="0.2032" layer="51"/>
<wire x1="-9.72" y1="9.71" x2="9.71" y2="9.71" width="0.2032" layer="21"/>
<wire x1="9.71" y1="9.71" x2="9.71" y2="-9.71" width="0.2032" layer="21"/>
<wire x1="9.71" y1="-9.71" x2="-9.72" y2="-9.71" width="0.2032" layer="21"/>
<wire x1="-9.72" y1="-9.71" x2="-9.72" y2="9.71" width="0.2032" layer="21"/>
<circle x="-8.5001" y="-8.5001" radius="0.7501" width="0.254" layer="21"/>
<smd name="1" x="-8.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="2" x="-8.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="3" x="-7.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="4" x="-7.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="5" x="-6.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="6" x="-6.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="7" x="-5.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="8" x="-5.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="9" x="-4.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="10" x="-4.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="11" x="-3.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="12" x="-3.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="13" x="-2.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="14" x="-2.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="15" x="-1.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="16" x="-1.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="17" x="-0.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="18" x="-0.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="19" x="0.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="20" x="0.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="21" x="1.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="22" x="1.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="23" x="2.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="24" x="2.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="25" x="3.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="26" x="3.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="27" x="4.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="28" x="4.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="29" x="5.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="30" x="5.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="31" x="6.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="32" x="6.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="33" x="7.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="34" x="7.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="35" x="8.25" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="36" x="8.75" y="-10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="37" x="10.6" y="-8.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="38" x="10.6" y="-8.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="39" x="10.6" y="-7.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="40" x="10.6" y="-7.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="41" x="10.6" y="-6.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="42" x="10.6" y="-6.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="43" x="10.6" y="-5.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="44" x="10.6" y="-5.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="45" x="10.6" y="-4.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="46" x="10.6" y="-4.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="47" x="10.6" y="-3.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="48" x="10.6" y="-3.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="49" x="10.6" y="-2.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="50" x="10.6" y="-2.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="51" x="10.6" y="-1.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="52" x="10.6" y="-1.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="53" x="10.6" y="-0.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="54" x="10.6" y="-0.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="55" x="10.6" y="0.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="56" x="10.6" y="0.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="57" x="10.6" y="1.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="58" x="10.6" y="1.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="59" x="10.6" y="2.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="60" x="10.6" y="2.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="61" x="10.6" y="3.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="62" x="10.6" y="3.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="63" x="10.6" y="4.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="64" x="10.6" y="4.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="65" x="10.6" y="5.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="66" x="10.6" y="5.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="67" x="10.6" y="6.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="68" x="10.6" y="6.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="69" x="10.6" y="7.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="70" x="10.6" y="7.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="71" x="10.6" y="8.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="72" x="10.6" y="8.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="73" x="8.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="74" x="8.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="75" x="7.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="76" x="7.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="77" x="6.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="78" x="6.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="79" x="5.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="80" x="5.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="81" x="4.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="82" x="4.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="83" x="3.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="84" x="3.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="85" x="2.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="86" x="2.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="87" x="1.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="88" x="1.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="89" x="0.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="90" x="0.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="91" x="-0.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="92" x="-0.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="93" x="-1.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="94" x="-1.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="95" x="-2.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="96" x="-2.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="97" x="-3.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="98" x="-3.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="99" x="-4.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="100" x="-4.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="101" x="-5.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="102" x="-5.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="103" x="-6.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="104" x="-6.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="105" x="-7.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="106" x="-7.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="107" x="-8.25" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="108" x="-8.75" y="10.6" dx="0.3" dy="1.6" layer="1"/>
<smd name="109" x="-10.6" y="8.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="110" x="-10.6" y="8.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="111" x="-10.6" y="7.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="112" x="-10.6" y="7.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="113" x="-10.6" y="6.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="114" x="-10.6" y="6.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="115" x="-10.6" y="5.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="116" x="-10.6" y="5.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="117" x="-10.6" y="4.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="118" x="-10.6" y="4.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="119" x="-10.6" y="3.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="120" x="-10.6" y="3.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="121" x="-10.6" y="2.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="122" x="-10.6" y="2.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="123" x="-10.6" y="1.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="124" x="-10.6" y="1.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="125" x="-10.6" y="0.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="126" x="-10.6" y="0.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="127" x="-10.6" y="-0.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="128" x="-10.6" y="-0.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="129" x="-10.6" y="-1.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="130" x="-10.6" y="-1.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="131" x="-10.6" y="-2.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="132" x="-10.6" y="-2.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="133" x="-10.6" y="-3.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="134" x="-10.6" y="-3.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="135" x="-10.6" y="-4.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="136" x="-10.6" y="-4.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="137" x="-10.6" y="-5.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="138" x="-10.6" y="-5.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="139" x="-10.6" y="-6.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="140" x="-10.6" y="-6.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="141" x="-10.6" y="-7.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="142" x="-10.6" y="-7.75" dx="1.6" dy="0.3" layer="1"/>
<smd name="143" x="-10.6" y="-8.25" dx="1.6" dy="0.3" layer="1"/>
<smd name="144" x="-10.6" y="-8.75" dx="1.6" dy="0.3" layer="1"/>
<text x="-3.81" y="-3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-8.8999" y1="-10.8999" x2="-8.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-8.4" y1="-10.8999" x2="-8.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-7.8999" y1="-10.8999" x2="-7.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-7.4" y1="-10.8999" x2="-7.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-6.8999" y1="-10.8999" x2="-6.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-6.4" y1="-10.8999" x2="-6.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-5.8999" y1="-10.8999" x2="-5.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-5.4" y1="-10.8999" x2="-5.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-4.8999" y1="-10.8999" x2="-4.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-4.4" y1="-10.8999" x2="-4.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-3.8999" y1="-10.8999" x2="-3.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-3.4" y1="-10.8999" x2="-3.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-2.8999" y1="-10.8999" x2="-2.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-2.4" y1="-10.8999" x2="-2.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-1.8999" y1="-10.8999" x2="-1.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-1.4" y1="-10.8999" x2="-1.1001" y2="-9.9499" layer="51"/>
<rectangle x1="-0.8999" y1="-10.8999" x2="-0.5999" y2="-9.9499" layer="51"/>
<rectangle x1="-0.4001" y1="-10.8999" x2="-0.1001" y2="-9.9499" layer="51"/>
<rectangle x1="0.1001" y1="-10.8999" x2="0.4001" y2="-9.9499" layer="51"/>
<rectangle x1="0.5999" y1="-10.8999" x2="0.8999" y2="-9.9499" layer="51"/>
<rectangle x1="1.1001" y1="-10.8999" x2="1.4" y2="-9.9499" layer="51"/>
<rectangle x1="1.5999" y1="-10.8999" x2="1.8999" y2="-9.9499" layer="51"/>
<rectangle x1="2.1001" y1="-10.8999" x2="2.4" y2="-9.9499" layer="51"/>
<rectangle x1="2.5999" y1="-10.8999" x2="2.8999" y2="-9.9499" layer="51"/>
<rectangle x1="3.1001" y1="-10.8999" x2="3.4" y2="-9.9499" layer="51"/>
<rectangle x1="3.5999" y1="-10.8999" x2="3.8999" y2="-9.9499" layer="51"/>
<rectangle x1="4.1001" y1="-10.8999" x2="4.4" y2="-9.9499" layer="51"/>
<rectangle x1="4.5999" y1="-10.8999" x2="4.8999" y2="-9.9499" layer="51"/>
<rectangle x1="5.1001" y1="-10.8999" x2="5.4" y2="-9.9499" layer="51"/>
<rectangle x1="5.5999" y1="-10.8999" x2="5.8999" y2="-9.9499" layer="51"/>
<rectangle x1="6.1001" y1="-10.8999" x2="6.4" y2="-9.9499" layer="51"/>
<rectangle x1="6.5999" y1="-10.8999" x2="6.8999" y2="-9.9499" layer="51"/>
<rectangle x1="7.1001" y1="-10.8999" x2="7.4" y2="-9.9499" layer="51"/>
<rectangle x1="7.5999" y1="-10.8999" x2="7.8999" y2="-9.9499" layer="51"/>
<rectangle x1="8.1001" y1="-10.8999" x2="8.4" y2="-9.9499" layer="51"/>
<rectangle x1="8.5999" y1="-10.8999" x2="8.8999" y2="-9.9499" layer="51"/>
<rectangle x1="9.9499" y1="-8.8999" x2="10.8999" y2="-8.5999" layer="51"/>
<rectangle x1="9.9499" y1="-8.4" x2="10.8999" y2="-8.1001" layer="51"/>
<rectangle x1="9.9499" y1="-7.8999" x2="10.8999" y2="-7.5999" layer="51"/>
<rectangle x1="9.9499" y1="-7.4" x2="10.8999" y2="-7.1001" layer="51"/>
<rectangle x1="9.9499" y1="-6.8999" x2="10.8999" y2="-6.5999" layer="51"/>
<rectangle x1="9.9499" y1="-6.4" x2="10.8999" y2="-6.1001" layer="51"/>
<rectangle x1="9.9499" y1="-5.8999" x2="10.8999" y2="-5.5999" layer="51"/>
<rectangle x1="9.9499" y1="-5.4" x2="10.8999" y2="-5.1001" layer="51"/>
<rectangle x1="9.9499" y1="-4.8999" x2="10.8999" y2="-4.5999" layer="51"/>
<rectangle x1="9.9499" y1="-4.4" x2="10.8999" y2="-4.1001" layer="51"/>
<rectangle x1="9.9499" y1="-3.8999" x2="10.8999" y2="-3.5999" layer="51"/>
<rectangle x1="9.9499" y1="-3.4" x2="10.8999" y2="-3.1001" layer="51"/>
<rectangle x1="9.9499" y1="-2.8999" x2="10.8999" y2="-2.5999" layer="51"/>
<rectangle x1="9.9499" y1="-2.4" x2="10.8999" y2="-2.1001" layer="51"/>
<rectangle x1="9.9499" y1="-1.8999" x2="10.8999" y2="-1.5999" layer="51"/>
<rectangle x1="9.9499" y1="-1.4" x2="10.8999" y2="-1.1001" layer="51"/>
<rectangle x1="9.9499" y1="-0.8999" x2="10.8999" y2="-0.5999" layer="51"/>
<rectangle x1="9.9499" y1="-0.4001" x2="10.8999" y2="-0.1001" layer="51"/>
<rectangle x1="9.9499" y1="0.1001" x2="10.8999" y2="0.4001" layer="51"/>
<rectangle x1="9.9499" y1="0.5999" x2="10.8999" y2="0.8999" layer="51"/>
<rectangle x1="9.9499" y1="1.1001" x2="10.8999" y2="1.4" layer="51"/>
<rectangle x1="9.9499" y1="1.5999" x2="10.8999" y2="1.8999" layer="51"/>
<rectangle x1="9.9499" y1="2.1001" x2="10.8999" y2="2.4" layer="51"/>
<rectangle x1="9.9499" y1="2.5999" x2="10.8999" y2="2.8999" layer="51"/>
<rectangle x1="9.9499" y1="3.1001" x2="10.8999" y2="3.4" layer="51"/>
<rectangle x1="9.9499" y1="3.5999" x2="10.8999" y2="3.8999" layer="51"/>
<rectangle x1="9.9499" y1="4.1001" x2="10.8999" y2="4.4" layer="51"/>
<rectangle x1="9.9499" y1="4.5999" x2="10.8999" y2="4.8999" layer="51"/>
<rectangle x1="9.9499" y1="5.1001" x2="10.8999" y2="5.4" layer="51"/>
<rectangle x1="9.9499" y1="5.5999" x2="10.8999" y2="5.8999" layer="51"/>
<rectangle x1="9.9499" y1="6.1001" x2="10.8999" y2="6.4" layer="51"/>
<rectangle x1="9.9499" y1="6.5999" x2="10.8999" y2="6.8999" layer="51"/>
<rectangle x1="9.9499" y1="7.1001" x2="10.8999" y2="7.4" layer="51"/>
<rectangle x1="9.9499" y1="7.5999" x2="10.8999" y2="7.8999" layer="51"/>
<rectangle x1="9.9499" y1="8.1001" x2="10.8999" y2="8.4" layer="51"/>
<rectangle x1="9.9499" y1="8.5999" x2="10.8999" y2="8.8999" layer="51"/>
<rectangle x1="8.5999" y1="9.9499" x2="8.8999" y2="10.8999" layer="51"/>
<rectangle x1="8.1001" y1="9.9499" x2="8.4" y2="10.8999" layer="51"/>
<rectangle x1="7.5999" y1="9.9499" x2="7.8999" y2="10.8999" layer="51"/>
<rectangle x1="7.1001" y1="9.9499" x2="7.4" y2="10.8999" layer="51"/>
<rectangle x1="6.5999" y1="9.9499" x2="6.8999" y2="10.8999" layer="51"/>
<rectangle x1="6.1001" y1="9.9499" x2="6.4" y2="10.8999" layer="51"/>
<rectangle x1="5.5999" y1="9.9499" x2="5.8999" y2="10.8999" layer="51"/>
<rectangle x1="5.1001" y1="9.9499" x2="5.4" y2="10.8999" layer="51"/>
<rectangle x1="4.5999" y1="9.9499" x2="4.8999" y2="10.8999" layer="51"/>
<rectangle x1="4.1001" y1="9.9499" x2="4.4" y2="10.8999" layer="51"/>
<rectangle x1="3.5999" y1="9.9499" x2="3.8999" y2="10.8999" layer="51"/>
<rectangle x1="3.1001" y1="9.9499" x2="3.4" y2="10.8999" layer="51"/>
<rectangle x1="2.5999" y1="9.9499" x2="2.8999" y2="10.8999" layer="51"/>
<rectangle x1="2.1001" y1="9.9499" x2="2.4" y2="10.8999" layer="51"/>
<rectangle x1="1.5999" y1="9.9499" x2="1.8999" y2="10.8999" layer="51"/>
<rectangle x1="1.1001" y1="9.9499" x2="1.4" y2="10.8999" layer="51"/>
<rectangle x1="0.5999" y1="9.9499" x2="0.8999" y2="10.8999" layer="51"/>
<rectangle x1="0.1001" y1="9.9499" x2="0.4001" y2="10.8999" layer="51"/>
<rectangle x1="-0.4001" y1="9.9499" x2="-0.1001" y2="10.8999" layer="51"/>
<rectangle x1="-0.8999" y1="9.9499" x2="-0.5999" y2="10.8999" layer="51"/>
<rectangle x1="-1.4" y1="9.9499" x2="-1.1001" y2="10.8999" layer="51"/>
<rectangle x1="-1.8999" y1="9.9499" x2="-1.5999" y2="10.8999" layer="51"/>
<rectangle x1="-2.4" y1="9.9499" x2="-2.1001" y2="10.8999" layer="51"/>
<rectangle x1="-2.8999" y1="9.9499" x2="-2.5999" y2="10.8999" layer="51"/>
<rectangle x1="-3.4" y1="9.9499" x2="-3.1001" y2="10.8999" layer="51"/>
<rectangle x1="-3.8999" y1="9.9499" x2="-3.5999" y2="10.8999" layer="51"/>
<rectangle x1="-4.4" y1="9.9499" x2="-4.1001" y2="10.8999" layer="51"/>
<rectangle x1="-4.8999" y1="9.9499" x2="-4.5999" y2="10.8999" layer="51"/>
<rectangle x1="-5.4" y1="9.9499" x2="-5.1001" y2="10.8999" layer="51"/>
<rectangle x1="-5.8999" y1="9.9499" x2="-5.5999" y2="10.8999" layer="51"/>
<rectangle x1="-6.4" y1="9.9499" x2="-6.1001" y2="10.8999" layer="51"/>
<rectangle x1="-6.8999" y1="9.9499" x2="-6.5999" y2="10.8999" layer="51"/>
<rectangle x1="-7.4" y1="9.9499" x2="-7.1001" y2="10.8999" layer="51"/>
<rectangle x1="-7.8999" y1="9.9499" x2="-7.5999" y2="10.8999" layer="51"/>
<rectangle x1="-8.4" y1="9.9499" x2="-8.1001" y2="10.8999" layer="51"/>
<rectangle x1="-8.8999" y1="9.9499" x2="-8.5999" y2="10.8999" layer="51"/>
<rectangle x1="-10.8999" y1="8.5999" x2="-9.9499" y2="8.8999" layer="51"/>
<rectangle x1="-10.8999" y1="8.1001" x2="-9.9499" y2="8.4" layer="51"/>
<rectangle x1="-10.8999" y1="7.5999" x2="-9.9499" y2="7.8999" layer="51"/>
<rectangle x1="-10.8999" y1="7.1001" x2="-9.9499" y2="7.4" layer="51"/>
<rectangle x1="-10.8999" y1="6.5999" x2="-9.9499" y2="6.8999" layer="51"/>
<rectangle x1="-10.8999" y1="6.1001" x2="-9.9499" y2="6.4" layer="51"/>
<rectangle x1="-10.8999" y1="5.5999" x2="-9.9499" y2="5.8999" layer="51"/>
<rectangle x1="-10.8999" y1="5.1001" x2="-9.9499" y2="5.4" layer="51"/>
<rectangle x1="-10.8999" y1="4.5999" x2="-9.9499" y2="4.8999" layer="51"/>
<rectangle x1="-10.8999" y1="4.1001" x2="-9.9499" y2="4.4" layer="51"/>
<rectangle x1="-10.8999" y1="3.5999" x2="-9.9499" y2="3.8999" layer="51"/>
<rectangle x1="-10.8999" y1="3.1001" x2="-9.9499" y2="3.4" layer="51"/>
<rectangle x1="-10.8999" y1="2.5999" x2="-9.9499" y2="2.8999" layer="51"/>
<rectangle x1="-10.8999" y1="2.1001" x2="-9.9499" y2="2.4" layer="51"/>
<rectangle x1="-10.8999" y1="1.5999" x2="-9.9499" y2="1.8999" layer="51"/>
<rectangle x1="-10.8999" y1="1.1001" x2="-9.9499" y2="1.4" layer="51"/>
<rectangle x1="-10.8999" y1="0.5999" x2="-9.9499" y2="0.8999" layer="51"/>
<rectangle x1="-10.8999" y1="0.1001" x2="-9.9499" y2="0.4001" layer="51"/>
<rectangle x1="-10.8999" y1="-0.4001" x2="-9.9499" y2="-0.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-0.8999" x2="-9.9499" y2="-0.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-1.4" x2="-9.9499" y2="-1.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-1.8999" x2="-9.9499" y2="-1.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-2.4" x2="-9.9499" y2="-2.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-2.8999" x2="-9.9499" y2="-2.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-3.4" x2="-9.9499" y2="-3.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-3.8999" x2="-9.9499" y2="-3.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-4.4" x2="-9.9499" y2="-4.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-4.8999" x2="-9.9499" y2="-4.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-5.4" x2="-9.9499" y2="-5.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-5.8999" x2="-9.9499" y2="-5.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-6.4" x2="-9.9499" y2="-6.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-6.8999" x2="-9.9499" y2="-6.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-7.4" x2="-9.9499" y2="-7.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-7.8999" x2="-9.9499" y2="-7.5999" layer="51"/>
<rectangle x1="-10.8999" y1="-8.4" x2="-9.9499" y2="-8.1001" layer="51"/>
<rectangle x1="-10.8999" y1="-8.8999" x2="-9.9499" y2="-8.5999" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="UC3C0512C">
<description>Atmel ATUC3C0512C 
AVR32 Microcontroller</description>
<pin name="PA00" x="-45.72" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA01" x="-43.18" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA02" x="-40.64" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA03" x="-38.1" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="VDDIO1" x="-35.56" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="GNDIO1" x="-33.02" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB04" x="-30.48" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB05" x="-27.94" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB06" x="-25.4" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB07" x="-22.86" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB08" x="-20.32" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB09" x="-17.78" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB10" x="-15.24" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB11" x="-12.7" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB12" x="-10.16" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB13" x="-7.62" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB14" x="-5.08" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB15" x="-2.54" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB16" x="0" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PB17" x="2.54" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA04" x="5.08" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA05" x="7.62" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA06" x="10.16" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA07" x="12.7" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA08" x="15.24" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA09" x="17.78" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA10" x="20.32" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA11" x="22.86" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA12" x="25.4" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA13" x="27.94" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA14" x="30.48" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA15" x="33.02" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA16" x="35.56" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="ADCVREFP" x="38.1" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="ADCVREFN" x="40.64" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="PA19" x="43.18" y="-58.42" visible="pin" length="middle" rot="R90"/>
<pin name="GNDANA" x="58.42" y="-43.18" visible="pin" length="middle" rot="R180"/>
<pin name="VDDANA" x="58.42" y="-40.64" visible="pin" length="middle" rot="R180"/>
<pin name="PA20" x="58.42" y="-38.1" visible="pin" length="middle" rot="R180"/>
<pin name="PA21" x="58.42" y="-35.56" visible="pin" length="middle" rot="R180"/>
<pin name="PA22" x="58.42" y="-33.02" visible="pin" length="middle" rot="R180"/>
<pin name="PA23" x="58.42" y="-30.48" visible="pin" length="middle" rot="R180"/>
<pin name="PA24" x="58.42" y="-27.94" visible="pin" length="middle" rot="R180"/>
<pin name="PA25" x="58.42" y="-25.4" visible="pin" length="middle" rot="R180"/>
<pin name="PA26" x="58.42" y="-22.86" visible="pin" length="middle" rot="R180"/>
<pin name="PA27" x="58.42" y="-20.32" visible="pin" length="middle" rot="R180"/>
<pin name="PA28" x="58.42" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="PA29" x="58.42" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="VBUS" x="58.42" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="DM" x="58.42" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="DP" x="58.42" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="GNDPLL" x="58.42" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="VDDIN_5" x="58.42" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="VDDIN_33" x="58.42" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="VDDCORE" x="58.42" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="GNDCORE" x="58.42" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="PB18" x="58.42" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="PB19" x="58.42" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="PB20" x="58.42" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="PB21" x="58.42" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="PB22" x="58.42" y="17.78" visible="pin" length="middle" rot="R180"/>
<pin name="PB23" x="58.42" y="20.32" visible="pin" length="middle" rot="R180"/>
<pin name="PB24" x="58.42" y="22.86" visible="pin" length="middle" rot="R180"/>
<pin name="PB25" x="58.42" y="25.4" visible="pin" length="middle" rot="R180"/>
<pin name="PB26" x="58.42" y="27.94" visible="pin" length="middle" rot="R180"/>
<pin name="PB27" x="58.42" y="30.48" visible="pin" length="middle" rot="R180"/>
<pin name="PB28" x="58.42" y="33.02" visible="pin" length="middle" rot="R180"/>
<pin name="PB29" x="58.42" y="35.56" visible="pin" length="middle" rot="R180"/>
<pin name="PB30" x="58.42" y="38.1" visible="pin" length="middle" rot="R180"/>
<pin name="PB31" x="58.42" y="40.64" visible="pin" length="middle" rot="R180"/>
<pin name="PC00" x="58.42" y="43.18" visible="pin" length="middle" rot="R180"/>
<pin name="PC01" x="58.42" y="45.72" visible="pin" length="middle" rot="R180"/>
<pin name="PC02" x="43.18" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC03" x="40.64" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="VDDIO2" x="38.1" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="GNDIO2" x="35.56" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC04" x="33.02" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC05" x="30.48" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC06" x="27.94" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC07" x="25.4" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC08" x="22.86" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC09" x="20.32" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC10" x="17.78" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC11" x="15.24" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC12" x="12.7" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC13" x="10.16" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC14" x="7.62" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC15" x="5.08" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC16" x="2.54" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC17" x="0" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC18" x="-2.54" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC19" x="-5.08" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC20" x="-7.62" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC21" x="-10.16" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC22" x="-12.7" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC23" x="-15.24" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC24" x="-17.78" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC25" x="-20.32" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC26" x="-22.86" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC27" x="-25.4" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC28" x="-27.94" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC29" x="-30.48" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="VDDIO3" x="-33.02" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="GNDIO3" x="-35.56" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC30" x="-38.1" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PC31" x="-40.64" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PD00" x="-43.18" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PD01" x="-45.72" y="60.96" visible="pin" length="middle" rot="R270"/>
<pin name="PD02" x="-60.96" y="45.72" visible="pin" length="middle"/>
<pin name="PD03" x="-60.96" y="43.18" visible="pin" length="middle"/>
<pin name="PD04" x="-60.96" y="40.64" visible="pin" length="middle"/>
<pin name="PD05" x="-60.96" y="38.1" visible="pin" length="middle"/>
<pin name="PD06" x="-60.96" y="35.56" visible="pin" length="middle"/>
<pin name="PD07" x="-60.96" y="33.02" visible="pin" length="middle"/>
<pin name="PD08" x="-60.96" y="30.48" visible="pin" length="middle"/>
<pin name="PD09" x="-60.96" y="27.94" visible="pin" length="middle"/>
<pin name="PD10" x="-60.96" y="25.4" visible="pin" length="middle"/>
<pin name="VDDIO4" x="-60.96" y="22.86" visible="pin" length="middle"/>
<pin name="GNDIO4" x="-60.96" y="20.32" visible="pin" length="middle"/>
<pin name="PD11" x="-60.96" y="17.78" visible="pin" length="middle"/>
<pin name="PD12" x="-60.96" y="15.24" visible="pin" length="middle"/>
<pin name="PD13" x="-60.96" y="12.7" visible="pin" length="middle"/>
<pin name="PD14" x="-60.96" y="10.16" visible="pin" length="middle"/>
<pin name="PD15" x="-60.96" y="7.62" visible="pin" length="middle"/>
<pin name="PD16" x="-60.96" y="5.08" visible="pin" length="middle"/>
<pin name="PD17" x="-60.96" y="2.54" visible="pin" length="middle"/>
<pin name="PD18" x="-60.96" y="0" visible="pin" length="middle"/>
<pin name="PD19" x="-60.96" y="-2.54" visible="pin" length="middle"/>
<pin name="PD20" x="-60.96" y="-5.08" visible="pin" length="middle"/>
<pin name="PD21" x="-60.96" y="-7.62" visible="pin" length="middle"/>
<pin name="PD22" x="-60.96" y="-10.16" visible="pin" length="middle"/>
<pin name="PD23" x="-60.96" y="-12.7" visible="pin" length="middle"/>
<pin name="PD24" x="-60.96" y="-15.24" visible="pin" length="middle"/>
<pin name="PD25" x="-60.96" y="-17.78" visible="pin" length="middle"/>
<pin name="PD26" x="-60.96" y="-20.32" visible="pin" length="middle"/>
<pin name="PD27" x="-60.96" y="-22.86" visible="pin" length="middle"/>
<pin name="PD28" x="-60.96" y="-25.4" visible="pin" length="middle"/>
<pin name="PD29" x="-60.96" y="-27.94" visible="pin" length="middle"/>
<pin name="PD30" x="-60.96" y="-30.48" visible="pin" length="middle"/>
<pin name="PB00" x="-60.96" y="-33.02" visible="pin" length="middle"/>
<pin name="PB01" x="-60.96" y="-35.56" visible="pin" length="middle"/>
<pin name="RESET_N" x="-60.96" y="-38.1" visible="pin" length="middle"/>
<pin name="PB02" x="-60.96" y="-40.64" visible="pin" length="middle"/>
<pin name="PB03" x="-60.96" y="-43.18" visible="pin" length="middle"/>
<wire x1="-55.88" y1="-53.34" x2="53.34" y2="-53.34" width="0.254" layer="94"/>
<wire x1="53.34" y1="-53.34" x2="53.34" y2="55.88" width="0.254" layer="94"/>
<wire x1="53.34" y1="55.88" x2="-55.88" y2="55.88" width="0.254" layer="94"/>
<wire x1="-55.88" y1="55.88" x2="-55.88" y2="-53.34" width="0.254" layer="94"/>
<circle x="-50.8" y="-48.26" radius="2.54" width="0" layer="94"/>
<text x="-58.42" y="60.96" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="0" size="2.54" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ATUC3C0512C" prefix="U">
<description>&lt;h4&gt;ATUC3C0512C&lt;/h4&gt;
&lt;a href="\\REPOSITORITF\volume1_public\ProyectosN\SOC_1202\Recursos compartidos\datasheets\Atmel\at32uc3c0512c.pdf"&gt;Datasheet&lt;/a&gt;&lt;br&gt;
&lt;a href="\\REPOSITORITF\volume1_public\ProyectosN\SOC_1202\Recursos compartidos\datasheets\Atmel\at32uc3c0512c-applications notes.pdf"&gt;Application Notes&lt;/a&gt;&lt;br&gt;
&lt;a href="\\REPOSITORITF\volume1_public\ProyectosN\SOC_1202\Recursos compartidos\datasheets\Atmel\at32uc3c-ek-shcematicboard.pdf"&gt;AT32UC3C-EK Schematic&lt;/a&gt;

&lt;ul&gt;
&lt;li&gt;Fabricante: Atmel&lt;/li&gt;
&lt;li&gt;AVR32 Microcontroller&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="UC3C0512C" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TQFP144">
<connects>
<connect gate="G$1" pin="ADCVREFN" pad="35"/>
<connect gate="G$1" pin="ADCVREFP" pad="34"/>
<connect gate="G$1" pin="DM" pad="50"/>
<connect gate="G$1" pin="DP" pad="51"/>
<connect gate="G$1" pin="GNDANA" pad="37"/>
<connect gate="G$1" pin="GNDCORE" pad="56"/>
<connect gate="G$1" pin="GNDIO1" pad="6"/>
<connect gate="G$1" pin="GNDIO2" pad="76"/>
<connect gate="G$1" pin="GNDIO3" pad="104"/>
<connect gate="G$1" pin="GNDIO4" pad="119"/>
<connect gate="G$1" pin="GNDPLL" pad="52"/>
<connect gate="G$1" pin="PA00" pad="1"/>
<connect gate="G$1" pin="PA01" pad="2"/>
<connect gate="G$1" pin="PA02" pad="3"/>
<connect gate="G$1" pin="PA03" pad="4"/>
<connect gate="G$1" pin="PA04" pad="21"/>
<connect gate="G$1" pin="PA05" pad="22"/>
<connect gate="G$1" pin="PA06" pad="23"/>
<connect gate="G$1" pin="PA07" pad="24"/>
<connect gate="G$1" pin="PA08" pad="25"/>
<connect gate="G$1" pin="PA09" pad="26"/>
<connect gate="G$1" pin="PA10" pad="27"/>
<connect gate="G$1" pin="PA11" pad="28"/>
<connect gate="G$1" pin="PA12" pad="29"/>
<connect gate="G$1" pin="PA13" pad="30"/>
<connect gate="G$1" pin="PA14" pad="31"/>
<connect gate="G$1" pin="PA15" pad="32"/>
<connect gate="G$1" pin="PA16" pad="33"/>
<connect gate="G$1" pin="PA19" pad="36"/>
<connect gate="G$1" pin="PA20" pad="39"/>
<connect gate="G$1" pin="PA21" pad="40"/>
<connect gate="G$1" pin="PA22" pad="41"/>
<connect gate="G$1" pin="PA23" pad="42"/>
<connect gate="G$1" pin="PA24" pad="43"/>
<connect gate="G$1" pin="PA25" pad="44"/>
<connect gate="G$1" pin="PA26" pad="45"/>
<connect gate="G$1" pin="PA27" pad="46"/>
<connect gate="G$1" pin="PA28" pad="47"/>
<connect gate="G$1" pin="PA29" pad="48"/>
<connect gate="G$1" pin="PB00" pad="140"/>
<connect gate="G$1" pin="PB01" pad="141"/>
<connect gate="G$1" pin="PB02" pad="143"/>
<connect gate="G$1" pin="PB03" pad="144"/>
<connect gate="G$1" pin="PB04" pad="7"/>
<connect gate="G$1" pin="PB05" pad="8"/>
<connect gate="G$1" pin="PB06" pad="9"/>
<connect gate="G$1" pin="PB07" pad="10"/>
<connect gate="G$1" pin="PB08" pad="11"/>
<connect gate="G$1" pin="PB09" pad="12"/>
<connect gate="G$1" pin="PB10" pad="13"/>
<connect gate="G$1" pin="PB11" pad="14"/>
<connect gate="G$1" pin="PB12" pad="15"/>
<connect gate="G$1" pin="PB13" pad="16"/>
<connect gate="G$1" pin="PB14" pad="17"/>
<connect gate="G$1" pin="PB15" pad="18"/>
<connect gate="G$1" pin="PB16" pad="19"/>
<connect gate="G$1" pin="PB17" pad="20"/>
<connect gate="G$1" pin="PB18" pad="57"/>
<connect gate="G$1" pin="PB19" pad="58"/>
<connect gate="G$1" pin="PB20" pad="59"/>
<connect gate="G$1" pin="PB21" pad="60"/>
<connect gate="G$1" pin="PB22" pad="61"/>
<connect gate="G$1" pin="PB23" pad="62"/>
<connect gate="G$1" pin="PB24" pad="63"/>
<connect gate="G$1" pin="PB25" pad="64"/>
<connect gate="G$1" pin="PB26" pad="65"/>
<connect gate="G$1" pin="PB27" pad="66"/>
<connect gate="G$1" pin="PB28" pad="67"/>
<connect gate="G$1" pin="PB29" pad="68"/>
<connect gate="G$1" pin="PB30" pad="69"/>
<connect gate="G$1" pin="PB31" pad="70"/>
<connect gate="G$1" pin="PC00" pad="71"/>
<connect gate="G$1" pin="PC01" pad="72"/>
<connect gate="G$1" pin="PC02" pad="73"/>
<connect gate="G$1" pin="PC03" pad="74"/>
<connect gate="G$1" pin="PC04" pad="77"/>
<connect gate="G$1" pin="PC05" pad="78"/>
<connect gate="G$1" pin="PC06" pad="79"/>
<connect gate="G$1" pin="PC07" pad="80"/>
<connect gate="G$1" pin="PC08" pad="81"/>
<connect gate="G$1" pin="PC09" pad="82"/>
<connect gate="G$1" pin="PC10" pad="83"/>
<connect gate="G$1" pin="PC11" pad="84"/>
<connect gate="G$1" pin="PC12" pad="85"/>
<connect gate="G$1" pin="PC13" pad="86"/>
<connect gate="G$1" pin="PC14" pad="87"/>
<connect gate="G$1" pin="PC15" pad="88"/>
<connect gate="G$1" pin="PC16" pad="89"/>
<connect gate="G$1" pin="PC17" pad="90"/>
<connect gate="G$1" pin="PC18" pad="91"/>
<connect gate="G$1" pin="PC19" pad="92"/>
<connect gate="G$1" pin="PC20" pad="93"/>
<connect gate="G$1" pin="PC21" pad="94"/>
<connect gate="G$1" pin="PC22" pad="95"/>
<connect gate="G$1" pin="PC23" pad="96"/>
<connect gate="G$1" pin="PC24" pad="97"/>
<connect gate="G$1" pin="PC25" pad="98"/>
<connect gate="G$1" pin="PC26" pad="99"/>
<connect gate="G$1" pin="PC27" pad="100"/>
<connect gate="G$1" pin="PC28" pad="101"/>
<connect gate="G$1" pin="PC29" pad="102"/>
<connect gate="G$1" pin="PC30" pad="105"/>
<connect gate="G$1" pin="PC31" pad="106"/>
<connect gate="G$1" pin="PD00" pad="107"/>
<connect gate="G$1" pin="PD01" pad="108"/>
<connect gate="G$1" pin="PD02" pad="109"/>
<connect gate="G$1" pin="PD03" pad="110"/>
<connect gate="G$1" pin="PD04" pad="111"/>
<connect gate="G$1" pin="PD05" pad="112"/>
<connect gate="G$1" pin="PD06" pad="113"/>
<connect gate="G$1" pin="PD07" pad="114"/>
<connect gate="G$1" pin="PD08" pad="115"/>
<connect gate="G$1" pin="PD09" pad="116"/>
<connect gate="G$1" pin="PD10" pad="117"/>
<connect gate="G$1" pin="PD11" pad="120"/>
<connect gate="G$1" pin="PD12" pad="121"/>
<connect gate="G$1" pin="PD13" pad="122"/>
<connect gate="G$1" pin="PD14" pad="123"/>
<connect gate="G$1" pin="PD15" pad="124"/>
<connect gate="G$1" pin="PD16" pad="125"/>
<connect gate="G$1" pin="PD17" pad="126"/>
<connect gate="G$1" pin="PD18" pad="127"/>
<connect gate="G$1" pin="PD19" pad="128"/>
<connect gate="G$1" pin="PD20" pad="129"/>
<connect gate="G$1" pin="PD21" pad="130"/>
<connect gate="G$1" pin="PD22" pad="131"/>
<connect gate="G$1" pin="PD23" pad="132"/>
<connect gate="G$1" pin="PD24" pad="133"/>
<connect gate="G$1" pin="PD25" pad="134"/>
<connect gate="G$1" pin="PD26" pad="135"/>
<connect gate="G$1" pin="PD27" pad="136"/>
<connect gate="G$1" pin="PD28" pad="137"/>
<connect gate="G$1" pin="PD29" pad="138"/>
<connect gate="G$1" pin="PD30" pad="139"/>
<connect gate="G$1" pin="RESET_N" pad="142"/>
<connect gate="G$1" pin="VBUS" pad="49"/>
<connect gate="G$1" pin="VDDANA" pad="38"/>
<connect gate="G$1" pin="VDDCORE" pad="55"/>
<connect gate="G$1" pin="VDDIN_33" pad="54"/>
<connect gate="G$1" pin="VDDIN_5" pad="53"/>
<connect gate="G$1" pin="VDDIO1" pad="5"/>
<connect gate="G$1" pin="VDDIO2" pad="75"/>
<connect gate="G$1" pin="VDDIO3" pad="103"/>
<connect gate="G$1" pin="VDDIO4" pad="118"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="AT32UC3C0512C-ALUT " constant="no"/>
<attribute name="OC_FARNELL" value="1972028 " constant="no"/>
<attribute name="OC_RS" value="738-0120 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_comunicaciones">
<description>Comunicaciones</description>
<packages>
<package name="SO08">
<description>&lt;b&gt;SMALL OUTLINE INTEGRATED CIRCUIT&lt;/b&gt;&lt;p&gt;
body 3.9 mm/JEDEC MS-012AA</description>
<wire x1="-2.9" y1="3.9" x2="2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="3.9" x2="2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="-3.9" x2="-2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="-2.9" y1="-3.9" x2="-2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.4" y1="1.27" x2="2.4" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="2.4" y1="-1.27" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.27" x2="-2.4" y2="1.27" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="1.9" x2="-2.399840625" y2="1.9" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1501" y1="-3.1001" x2="-1.6599" y2="-2" layer="51"/>
<rectangle x1="-0.8801" y1="-3.1001" x2="-0.3899" y2="-2" layer="51"/>
<rectangle x1="0.3899" y1="-3.1001" x2="0.8801" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="-3.1001" x2="2.1501" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="2" x2="2.1501" y2="3.1001" layer="51"/>
<rectangle x1="0.3899" y1="2" x2="0.8801" y2="3.1001" layer="51"/>
<rectangle x1="-0.8801" y1="2" x2="-0.3899" y2="3.1001" layer="51"/>
<rectangle x1="-2.1501" y1="2" x2="-1.6599" y2="3.1001" layer="51"/>
<wire x1="-2.399840625" y1="1.9" x2="2.399840625" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.399840625" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.399840625" y1="1.27" x2="-2.399840625" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.27" x2="2.4" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="2.4" y1="1.27" x2="-2.4" y2="1.27" width="0.2032" layer="21"/>
<wire x1="2.399840625" y1="1.27" x2="2.399840625" y2="1.9" width="0.2032" layer="51"/>
<circle x="-1.905" y="-0.635" radius="0.254" width="0" layer="21"/>
</package>
<package name="SOIC127P600X175-16N">
<smd name="1" x="-2.4638" y="4.445" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="2" x="-2.4638" y="3.175" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="3" x="-2.4638" y="1.905" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="4" x="-2.4638" y="0.635" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="5" x="-2.4638" y="-0.635" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="6" x="-2.4638" y="-1.905" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="7" x="-2.4638" y="-3.175" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="8" x="-2.4638" y="-4.445" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="9" x="2.4638" y="-4.445" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="10" x="2.4638" y="-3.175" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="11" x="2.4638" y="-1.905" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="12" x="2.4638" y="-0.635" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="13" x="2.4638" y="0.635" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="14" x="2.4638" y="1.905" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="15" x="2.4638" y="3.175" dx="1.9812" dy="0.5588" layer="1"/>
<smd name="16" x="2.4638" y="4.445" dx="1.9812" dy="0.5588" layer="1"/>
<wire x1="-2.0066" y1="4.191" x2="-2.0066" y2="4.699" width="0" layer="51"/>
<wire x1="-2.0066" y1="4.699" x2="-3.0988" y2="4.699" width="0" layer="51"/>
<wire x1="-3.0988" y1="4.699" x2="-3.0988" y2="4.191" width="0" layer="51"/>
<wire x1="-3.0988" y1="4.191" x2="-2.0066" y2="4.191" width="0" layer="51"/>
<wire x1="-2.0066" y1="2.921" x2="-2.0066" y2="3.429" width="0" layer="51"/>
<wire x1="-2.0066" y1="3.429" x2="-3.0988" y2="3.429" width="0" layer="51"/>
<wire x1="-3.0988" y1="3.429" x2="-3.0988" y2="2.921" width="0" layer="51"/>
<wire x1="-3.0988" y1="2.921" x2="-2.0066" y2="2.921" width="0" layer="51"/>
<wire x1="-2.0066" y1="1.651" x2="-2.0066" y2="2.159" width="0" layer="51"/>
<wire x1="-2.0066" y1="2.159" x2="-3.0988" y2="2.159" width="0" layer="51"/>
<wire x1="-3.0988" y1="2.159" x2="-3.0988" y2="1.651" width="0" layer="51"/>
<wire x1="-3.0988" y1="1.651" x2="-2.0066" y2="1.651" width="0" layer="51"/>
<wire x1="-2.0066" y1="0.381" x2="-2.0066" y2="0.889" width="0" layer="51"/>
<wire x1="-2.0066" y1="0.889" x2="-3.0988" y2="0.889" width="0" layer="51"/>
<wire x1="-3.0988" y1="0.889" x2="-3.0988" y2="0.381" width="0" layer="51"/>
<wire x1="-3.0988" y1="0.381" x2="-2.0066" y2="0.381" width="0" layer="51"/>
<wire x1="-2.0066" y1="-0.889" x2="-2.0066" y2="-0.381" width="0" layer="51"/>
<wire x1="-2.0066" y1="-0.381" x2="-3.0988" y2="-0.381" width="0" layer="51"/>
<wire x1="-3.0988" y1="-0.381" x2="-3.0988" y2="-0.889" width="0" layer="51"/>
<wire x1="-3.0988" y1="-0.889" x2="-2.0066" y2="-0.889" width="0" layer="51"/>
<wire x1="-2.0066" y1="-2.159" x2="-2.0066" y2="-1.651" width="0" layer="51"/>
<wire x1="-2.0066" y1="-1.651" x2="-3.0988" y2="-1.651" width="0" layer="51"/>
<wire x1="-3.0988" y1="-1.651" x2="-3.0988" y2="-2.159" width="0" layer="51"/>
<wire x1="-3.0988" y1="-2.159" x2="-2.0066" y2="-2.159" width="0" layer="51"/>
<wire x1="-2.0066" y1="-3.429" x2="-2.0066" y2="-2.921" width="0" layer="51"/>
<wire x1="-2.0066" y1="-2.921" x2="-3.0988" y2="-2.921" width="0" layer="51"/>
<wire x1="-3.0988" y1="-2.921" x2="-3.0988" y2="-3.429" width="0" layer="51"/>
<wire x1="-3.0988" y1="-3.429" x2="-2.0066" y2="-3.429" width="0" layer="51"/>
<wire x1="-2.0066" y1="-4.699" x2="-2.0066" y2="-4.191" width="0" layer="51"/>
<wire x1="-2.0066" y1="-4.191" x2="-3.0988" y2="-4.191" width="0" layer="51"/>
<wire x1="-3.0988" y1="-4.191" x2="-3.0988" y2="-4.699" width="0" layer="51"/>
<wire x1="-3.0988" y1="-4.699" x2="-2.0066" y2="-4.699" width="0" layer="51"/>
<wire x1="2.0066" y1="-4.191" x2="2.0066" y2="-4.699" width="0" layer="51"/>
<wire x1="2.0066" y1="-4.699" x2="3.0988" y2="-4.699" width="0" layer="51"/>
<wire x1="3.0988" y1="-4.699" x2="3.0988" y2="-4.191" width="0" layer="51"/>
<wire x1="3.0988" y1="-4.191" x2="2.0066" y2="-4.191" width="0" layer="51"/>
<wire x1="2.0066" y1="-2.921" x2="2.0066" y2="-3.429" width="0" layer="51"/>
<wire x1="2.0066" y1="-3.429" x2="3.0988" y2="-3.429" width="0" layer="51"/>
<wire x1="3.0988" y1="-3.429" x2="3.0988" y2="-2.921" width="0" layer="51"/>
<wire x1="3.0988" y1="-2.921" x2="2.0066" y2="-2.921" width="0" layer="51"/>
<wire x1="2.0066" y1="-1.651" x2="2.0066" y2="-2.159" width="0" layer="51"/>
<wire x1="2.0066" y1="-2.159" x2="3.0988" y2="-2.159" width="0" layer="51"/>
<wire x1="3.0988" y1="-2.159" x2="3.0988" y2="-1.651" width="0" layer="51"/>
<wire x1="3.0988" y1="-1.651" x2="2.0066" y2="-1.651" width="0" layer="51"/>
<wire x1="2.0066" y1="-0.381" x2="2.0066" y2="-0.889" width="0" layer="51"/>
<wire x1="2.0066" y1="-0.889" x2="3.0988" y2="-0.889" width="0" layer="51"/>
<wire x1="3.0988" y1="-0.889" x2="3.0988" y2="-0.381" width="0" layer="51"/>
<wire x1="3.0988" y1="-0.381" x2="2.0066" y2="-0.381" width="0" layer="51"/>
<wire x1="2.0066" y1="0.889" x2="2.0066" y2="0.381" width="0" layer="51"/>
<wire x1="2.0066" y1="0.381" x2="3.0988" y2="0.381" width="0" layer="51"/>
<wire x1="3.0988" y1="0.381" x2="3.0988" y2="0.889" width="0" layer="51"/>
<wire x1="3.0988" y1="0.889" x2="2.0066" y2="0.889" width="0" layer="51"/>
<wire x1="2.0066" y1="2.159" x2="2.0066" y2="1.651" width="0" layer="51"/>
<wire x1="2.0066" y1="1.651" x2="3.0988" y2="1.651" width="0" layer="51"/>
<wire x1="3.0988" y1="1.651" x2="3.0988" y2="2.159" width="0" layer="51"/>
<wire x1="3.0988" y1="2.159" x2="2.0066" y2="2.159" width="0" layer="51"/>
<wire x1="2.0066" y1="3.429" x2="2.0066" y2="2.921" width="0" layer="51"/>
<wire x1="2.0066" y1="2.921" x2="3.0988" y2="2.921" width="0" layer="51"/>
<wire x1="3.0988" y1="2.921" x2="3.0988" y2="3.429" width="0" layer="51"/>
<wire x1="3.0988" y1="3.429" x2="2.0066" y2="3.429" width="0" layer="51"/>
<wire x1="2.0066" y1="4.699" x2="2.0066" y2="4.191" width="0" layer="51"/>
<wire x1="2.0066" y1="4.191" x2="3.0988" y2="4.191" width="0" layer="51"/>
<wire x1="3.0988" y1="4.191" x2="3.0988" y2="4.699" width="0" layer="51"/>
<wire x1="3.0988" y1="4.699" x2="2.0066" y2="4.699" width="0" layer="51"/>
<wire x1="-2.0066" y1="-5.0038" x2="2.0066" y2="-5.0038" width="0" layer="51"/>
<wire x1="2.0066" y1="-5.0038" x2="2.0066" y2="5.0038" width="0" layer="51"/>
<wire x1="2.0066" y1="5.0038" x2="0.3048" y2="5.0038" width="0" layer="51"/>
<wire x1="0.3048" y1="5.0038" x2="-0.3048" y2="5.0038" width="0" layer="51"/>
<wire x1="-0.3048" y1="5.0038" x2="-2.0066" y2="5.0038" width="0" layer="51"/>
<wire x1="-2.0066" y1="5.0038" x2="-2.0066" y2="-5.0038" width="0" layer="51"/>
<wire x1="0.3048" y1="5.0038" x2="-0.3048" y2="5.0038" width="0" layer="51" curve="-180"/>
<text x="-3.302" y="4.8768" size="1.27" layer="51" ratio="6" rot="SR0">*</text>
<wire x1="3.7846" y1="-2.9718" x2="4.8006" y2="-2.9718" width="0.1524" layer="21"/>
<wire x1="-1.2954" y1="-5.0038" x2="1.2954" y2="-5.0038" width="0.1524" layer="21"/>
<wire x1="1.2954" y1="5.0038" x2="0.3048" y2="5.0038" width="0.1524" layer="21"/>
<wire x1="0.3048" y1="5.0038" x2="-0.3048" y2="5.0038" width="0.1524" layer="21"/>
<wire x1="-0.3048" y1="5.0038" x2="-1.2954" y2="5.0038" width="0.1524" layer="21"/>
<wire x1="0.3048" y1="5.0038" x2="-0.3048" y2="5.0038" width="0.1524" layer="21" curve="-180"/>
<text x="-3.302" y="4.8768" size="1.27" layer="21" ratio="6" rot="SR0">*</text>
<text x="-3.4544" y="6.985" size="2.0828" layer="25" ratio="10" rot="SR0">&gt;NAME</text>
<text x="-3.4544" y="-8.255" size="2.0828" layer="27" ratio="10" rot="SR0">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MCP2551">
<description>CAN Transciever</description>
<pin name="VSS" x="7.62" y="-5.08" visible="pin" length="short" rot="R90"/>
<pin name="VDD" x="12.7" y="-5.08" visible="pin" length="short" rot="R90"/>
<pin name="RXD" x="17.78" y="-5.08" visible="pin" length="short" rot="R90"/>
<pin name="TXD" x="2.54" y="-5.08" visible="pin" length="short" rot="R90"/>
<pin name="RS" x="2.54" y="15.24" visible="pin" length="short" rot="R270"/>
<pin name="CANH" x="7.62" y="15.24" visible="pin" length="short" rot="R270"/>
<pin name="CANL" x="12.7" y="15.24" visible="pin" length="short" rot="R270"/>
<pin name="VREF" x="17.78" y="15.24" visible="pin" length="short" rot="R270"/>
<wire x1="-2.54" y1="-2.54" x2="20.32" y2="-2.54" width="0.254" layer="94"/>
<wire x1="20.32" y1="-2.54" x2="20.32" y2="12.7" width="0.254" layer="94"/>
<wire x1="20.32" y1="12.7" x2="-2.54" y2="12.7" width="0.254" layer="94"/>
<wire x1="-2.54" y1="12.7" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0" layer="94"/>
<text x="-5.08" y="-2.54" size="2.54" layer="95" rot="R90">&gt;NAME</text>
<text x="25.4" y="-2.54" size="2.54" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="MAX232ID">
<pin name="VCC" x="-17.78" y="20.32" length="middle" direction="pwr"/>
<pin name="VS+" x="-17.78" y="-12.7" length="middle" direction="in"/>
<pin name="C1+" x="-17.78" y="12.7" length="middle" direction="in"/>
<pin name="C1-" x="-17.78" y="7.62" length="middle" direction="in"/>
<pin name="C2-" x="-17.78" y="0" length="middle" direction="in"/>
<pin name="C2+" x="-17.78" y="-5.08" length="middle" direction="in"/>
<pin name="T1IN" x="17.78" y="-7.62" length="middle" direction="in" rot="R180"/>
<pin name="T2IN" x="17.78" y="-10.16" length="middle" direction="in" rot="R180"/>
<pin name="R1IN" x="17.78" y="-15.24" length="middle" direction="in" rot="R180"/>
<pin name="R2IN" x="17.78" y="-17.78" length="middle" direction="in" rot="R180"/>
<pin name="VS-" x="-17.78" y="-17.78" length="middle" direction="in"/>
<pin name="GND" x="-17.78" y="-25.4" length="middle" direction="pas"/>
<pin name="T1OUT" x="17.78" y="12.7" length="middle" direction="out" rot="R180"/>
<pin name="T2OUT" x="17.78" y="10.16" length="middle" direction="out" rot="R180"/>
<pin name="R1OUT" x="17.78" y="5.08" length="middle" direction="out" rot="R180"/>
<pin name="R2OUT" x="17.78" y="2.54" length="middle" direction="out" rot="R180"/>
<wire x1="-12.7" y1="22.86" x2="-12.7" y2="-27.94" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-27.94" x2="12.7" y2="-27.94" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-27.94" x2="12.7" y2="22.86" width="0.4064" layer="94"/>
<wire x1="12.7" y1="22.86" x2="-12.7" y2="22.86" width="0.4064" layer="94"/>
<text x="-5.7658" y="24.3332" size="2.0828" layer="95" ratio="10" rot="SR0">&gt;NAME</text>
<text x="-4.6736" y="-30.9372" size="2.0828" layer="96" ratio="10" rot="SR0">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MCP2551" prefix="U">
<description>&lt;h4&gt;CAN Transciever&lt;/h4&gt;</description>
<gates>
<gate name="G$1" symbol="MCP2551" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO08">
<connects>
<connect gate="G$1" pin="CANH" pad="7"/>
<connect gate="G$1" pin="CANL" pad="6"/>
<connect gate="G$1" pin="RS" pad="8"/>
<connect gate="G$1" pin="RXD" pad="4"/>
<connect gate="G$1" pin="TXD" pad="1"/>
<connect gate="G$1" pin="VDD" pad="3"/>
<connect gate="G$1" pin="VREF" pad="5"/>
<connect gate="G$1" pin="VSS" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="MCP2551" constant="no"/>
<attribute name="OC_FARNELL" value="1467746 " constant="no"/>
<attribute name="OC_RS" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MAX232ID" prefix="U">
<description>DUAL EIA-232 DRIVERS/ RECEIVERS</description>
<gates>
<gate name="A" symbol="MAX232ID" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOIC127P600X175-16N">
<connects>
<connect gate="A" pin="C1+" pad="1"/>
<connect gate="A" pin="C1-" pad="3"/>
<connect gate="A" pin="C2+" pad="4"/>
<connect gate="A" pin="C2-" pad="5"/>
<connect gate="A" pin="GND" pad="15"/>
<connect gate="A" pin="R1IN" pad="13"/>
<connect gate="A" pin="R1OUT" pad="12"/>
<connect gate="A" pin="R2IN" pad="8"/>
<connect gate="A" pin="R2OUT" pad="9"/>
<connect gate="A" pin="T1IN" pad="11"/>
<connect gate="A" pin="T1OUT" pad="14"/>
<connect gate="A" pin="T2IN" pad="10"/>
<connect gate="A" pin="T2OUT" pad="7"/>
<connect gate="A" pin="VCC" pad="16"/>
<connect gate="A" pin="VS+" pad="2"/>
<connect gate="A" pin="VS-" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="MAX232ID" constant="no"/>
<attribute name="OC_FARNELL" value="9589791" constant="no"/>
<attribute name="OC_NEWARK" value="75C0974" constant="no"/>
<attribute name="PACKAGE" value="SOIC-16" constant="no"/>
<attribute name="SUPPLIER" value="Texas Instruments" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_xtal">
<packages>
<package name="HC49UP">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.1091" y1="1.143" x2="-3.429" y2="2.0321" width="0.0508" layer="21" curve="-55.770993"/>
<wire x1="-5.715" y1="1.143" x2="-5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.032" x2="5.1091" y2="1.143" width="0.0508" layer="21" curve="-55.772485"/>
<wire x1="5.715" y1="1.143" x2="5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="-3.429" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="3.429" y1="-2.032" x2="-3.429" y2="-2.032" width="0.0508" layer="21"/>
<wire x1="-3.429" y1="1.27" x2="3.429" y2="1.27" width="0.0508" layer="21"/>
<wire x1="5.461" y1="-2.413" x2="-5.461" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-0.381" x2="6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="6.477" y1="-0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="5.461" y1="-2.413" x2="5.715" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.715" y1="-1.143" x2="5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-2.159" x2="5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="3.9826" y2="-1.143" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="3.429" y1="1.27" x2="3.9826" y2="1.143" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="3.429" y1="-2.032" x2="5.109" y2="-1.1429" width="0.0508" layer="21" curve="55.771157"/>
<wire x1="3.9826" y1="-1.143" x2="3.9826" y2="1.143" width="0.0508" layer="51" curve="128.314524"/>
<wire x1="5.1091" y1="-1.143" x2="5.1091" y2="1.143" width="0.0508" layer="51" curve="68.456213"/>
<wire x1="-5.1091" y1="-1.143" x2="-3.429" y2="-2.032" width="0.0508" layer="21" curve="55.772485"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.9826" y2="1.143" width="0.0508" layer="51" curve="-128.314524"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.429" y2="-1.27" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="-3.9826" y1="1.143" x2="-3.429" y2="1.27" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="-6.477" y1="-0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.1091" y1="-1.143" x2="-5.1091" y2="1.143" width="0.0508" layer="51" curve="-68.456213"/>
<wire x1="-5.715" y1="-1.143" x2="-5.715" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-0.381" x2="-5.715" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-2.159" x2="-5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.159" x2="-5.461" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.715" y1="-0.381" x2="-6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="2.032" x2="3.429" y2="2.032" width="0.0508" layer="21"/>
<wire x1="5.461" y1="2.413" x2="-5.461" y2="2.413" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.413" x2="5.715" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.715" y1="2.159" x2="-5.461" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.254" y1="0.635" x2="-0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.635" x2="0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.635" x2="0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.635" x2="-0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.016" y2="0" width="0.0508" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.016" y2="0" width="0.0508" layer="21"/>
<smd name="1" x="-4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<smd name="2" x="4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<text x="-5.715" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.604" y1="-3.048" x2="6.604" y2="3.048" layer="43"/>
</package>
</packages>
<symbols>
<symbol name="CRYSTAL_SMD">
<pin name="1" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="2" x="10.16" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="3.81" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-3.81" width="0.254" layer="94"/>
<wire x1="2.54" y1="3.81" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="2.54" y1="-3.81" x2="0" y2="-3.81" width="0.254" layer="94"/>
<wire x1="0" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<rectangle x1="0" y1="-3.81" x2="2.54" y2="3.81" layer="94"/>
<text x="-1.27" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.27" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CRYSTAL_49SMX" prefix="Y">
<description>&lt;h4&gt;Crystal&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;Fabricante: Euroquartz&lt;/li&gt;
&lt;li&gt;16MHz&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="&gt;NAME" symbol="CRYSTAL_SMD" x="7.62" y="-7.62"/>
</gates>
<devices>
<device name="" package="HC49UP">
<connects>
<connect gate="&gt;NAME" pin="1" pad="1"/>
<connect gate="&gt;NAME" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="16.000MHZ 49USMX/30/50/40/18PF/ATF" constant="no"/>
<attribute name="OC_FARNELL" value="1640900 " constant="no"/>
<attribute name="OC_RS" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_ferritas">
<description>Ferritas para supresion de EMIs</description>
<packages>
<package name="0603">
<description>SMD</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="1806">
<smd name="P$1" x="-1.905" y="0" dx="1.5" dy="1.2" layer="1"/>
<smd name="P$2" x="1.845" y="0" dx="1.5" dy="1.2" layer="1"/>
<wire x1="-3.105" y1="1.2" x2="3.195" y2="1.2" width="0.127" layer="21"/>
<wire x1="3.195" y1="1.2" x2="3.195" y2="-1.2" width="0.127" layer="21"/>
<wire x1="3.195" y1="-1.2" x2="-3.105" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-3.105" y1="-1.2" x2="-3.105" y2="1.2" width="0.127" layer="21"/>
<wire x1="-3.105" y1="1.2" x2="3.195" y2="1.2" width="0.127" layer="39"/>
<wire x1="3.195" y1="1.2" x2="3.195" y2="-1.2" width="0.127" layer="39"/>
<wire x1="3.195" y1="-1.2" x2="-3.105" y2="-1.2" width="0.127" layer="39"/>
<wire x1="-3.105" y1="-1.2" x2="-3.105" y2="1.2" width="0.127" layer="39"/>
<text x="-3.105" y="2.1" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.105" y="-3" size="1.27" layer="27">&gt;TVALUE</text>
</package>
</packages>
<symbols>
<symbol name="FERRITA">
<pin name="1" x="-7.62" y="0" visible="off" length="short"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
<rectangle x1="-5.08" y1="-1.524" x2="2.54" y2="1.524" layer="94"/>
<text x="-5.08" y="2.54" size="1.27" layer="95">&gt;NAME</text>
<text x="-5.08" y="-3.81" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="BLM18H" prefix="L">
<description>&lt;h4&gt;Ferrita&lt;/h4&gt;
&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;Fabricante: Murata&lt;/li&gt;
&lt;li&gt;Package: 0603&lt;/li&gt;
&lt;li&gt;Resistencia DC: 1ohm&lt;/li&gt;
&lt;li&gt;Corriente DC:200mA&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="FERRITA" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="BLM18HG601SN1D" constant="no"/>
<attribute name="OC_FARNELL" value="1515733" constant="no"/>
<attribute name="OC_RS" value="724-1378 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BLM41PG600SN1L" prefix="FE">
<description>&lt;h4&gt;
Ferrita BLM41PG600SN1L
&lt;/h4&gt;
Chip Ferrite Bead
&lt;br&gt;
&lt;a href="http://search.murata.co.jp/Ceramy/image/img/PDF/ENG/L0110S0100BLM41P.pdf"&gt;datasheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="FERRITA" x="7.62" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="1806">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="OC_FARNELL" value="9526900" constant="no"/>
<attribute name="OC_RS" value="188-8665" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_led">
<description>LED</description>
<packages>
<package name="HSMF-C">
<smd name="3" x="-1.7526" y="-0.6985" dx="1.4986" dy="0.9906" layer="1"/>
<smd name="1" x="-1.7526" y="0.6985" dx="1.4986" dy="0.9906" layer="1"/>
<smd name="2" x="1.7526" y="0.6985" dx="1.4986" dy="0.9906" layer="1"/>
<smd name="4" x="1.7526" y="-0.6985" dx="1.4986" dy="0.9906" layer="1"/>
<wire x1="-1.6002" y1="-1.3462" x2="1.6002" y2="-1.3462" width="0.127" layer="21"/>
<wire x1="1.6002" y1="-1.3462" x2="1.6002" y2="1.3462" width="0.127" layer="21"/>
<wire x1="1.6002" y1="1.3462" x2="-1.6002" y2="1.3462" width="0.127" layer="21"/>
<wire x1="-1.6002" y1="1.3462" x2="-1.6002" y2="-1.3462" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="1.27" y="0"/>
<vertex x="0" y="-0.508"/>
<vertex x="0" y="0.508"/>
</polygon>
<text x="-1.27" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="HSMF-C155">
<pin name="1" x="-5.08" y="2.54" visible="off" length="short"/>
<pin name="3" x="-5.08" y="-2.54" visible="off" length="short"/>
<pin name="2" x="2.54" y="2.54" visible="off" length="short" rot="R180"/>
<pin name="4" x="2.54" y="-2.54" visible="off" length="short" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<text x="-5.08" y="5.842" size="2.032" layer="95">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="2.032" layer="96">&gt;VALUE</text>
<text x="-2.286" y="-3.048" size="1.143" layer="94">R</text>
<text x="-2.286" y="2.032" size="1.143" layer="94">G</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="HSMF-C155" prefix="D">
<description>&lt;h4&gt;Led bicolor Rojo y Verde&lt;/h4&gt;
&lt;a href="http://www.avagotech.com/docs/AV02-0427EN"&gt;Datasheet&lt;/a&gt;
&lt;p&gt;Forward current: 20mA&lt;br&gt;Forward voltage: 2.1V@20mA&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="HSMF-C155" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HSMF-C">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="HSMF-C155" constant="no"/>
<attribute name="OC_FARNELL" value="579-0888 " constant="no"/>
<attribute name="OC_RS" value="486-0430 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_conectores_thd">
<description>Conectores THD</description>
<packages>
<package name="THD-SQT-104-01-L-S">
<pad name="1" x="-3" y="0" drill="0.8" diameter="1.4224" shape="square"/>
<pad name="2" x="-1" y="0" drill="0.8" diameter="1.4224"/>
<pad name="3" x="1" y="0" drill="0.8" diameter="1.4224"/>
<pad name="4" x="3" y="0" drill="0.8" diameter="1.4224"/>
<wire x1="-4.15" y1="1" x2="4.15" y2="1" width="0.127" layer="21"/>
<wire x1="4.15" y1="1" x2="4.15" y2="-1" width="0.127" layer="21"/>
<wire x1="4.15" y1="-1" x2="-4.15" y2="-1" width="0.127" layer="21"/>
<wire x1="-4.15" y1="-1" x2="-4.15" y2="1" width="0.127" layer="21"/>
<text x="-4" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-4" y="-3" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="S4B-ZR">
<description>&lt;b&gt;ZH CONNECTOR&lt;/b&gt; Side entry type, 1.5 mm, 4 pin 1 row&lt;p&gt;
Source: http://www.jst.com .. eZH.pdf</description>
<wire x1="3.65" y1="-4.5" x2="-3.65" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-4.5" x2="-3.65" y2="1.275" width="0.2032" layer="21"/>
<wire x1="3.65" y1="1.275" x2="3.65" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="3.65" y1="1.275" x2="-3.65" y2="1.275" width="0.2032" layer="21"/>
<wire x1="-3.55" y1="0.325" x2="3.55" y2="0.325" width="0.2032" layer="51"/>
<pad name="1" x="-2.25" y="0" drill="0.7" diameter="1.1684" shape="square"/>
<pad name="2" x="-0.75" y="0" drill="0.7" diameter="1.1684"/>
<pad name="3" x="0.75" y="0" drill="0.7" diameter="1.1684"/>
<pad name="4" x="2.25" y="0" drill="0.7" diameter="1.1684"/>
<text x="-3.75" y="1.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.81" y1="-6.985" x2="3.81" y2="-4.445" layer="39"/>
</package>
<package name="S3B-ZR">
<description>&lt;b&gt;ZH CONNECTOR&lt;/b&gt; Side entry type, 1.5 mm, 4 pin 1 row&lt;p&gt;
Source: http://www.jst.com .. eZH.pdf</description>
<wire x1="2.897" y1="-4.5" x2="-2.897" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-2.897" y1="-4.5" x2="-2.897" y2="1.275" width="0.2032" layer="21"/>
<wire x1="2.897" y1="1.275" x2="2.897" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="2.897" y1="1.275" x2="-2.897" y2="1.275" width="0.2032" layer="21"/>
<wire x1="-2.897" y1="0.325" x2="2.897" y2="0.325" width="0.2032" layer="51"/>
<pad name="1" x="-1.5" y="0" drill="0.7" diameter="1.1684" shape="square"/>
<pad name="2" x="0" y="0" drill="0.7" diameter="1.1684"/>
<pad name="3" x="1.5" y="0" drill="0.7" diameter="1.1684"/>
<text x="-2.48" y="1.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.175" y1="-6.985" x2="3.175" y2="-4.445" layer="39"/>
</package>
<package name="B8B-ZR">
<description>&lt;b&gt;ZH CONNECTOR&lt;/b&gt;  Top entry type, 1.5 mm, 7 pin 1 row&lt;p&gt;
Source: http://www.jst.com .. eZH.pdf</description>
<wire x1="6.74999375" y1="-2.1" x2="-6.74999375" y2="-2.1" width="0.2032" layer="21"/>
<wire x1="-6.74999375" y1="-2.1" x2="-6.74999375" y2="1.2" width="0.2032" layer="21"/>
<wire x1="6.74999375" y1="1.2" x2="6.74999375" y2="-2.1" width="0.2032" layer="21"/>
<wire x1="6.74999375" y1="1.2" x2="-6.74999375" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-5.499996875" y1="1" x2="-5.499996875" y2="1.15" width="0.2032" layer="21"/>
<wire x1="-5.499996875" y1="1" x2="-4.999996875" y2="1" width="0.2032" layer="21"/>
<wire x1="-4.999996875" y1="1" x2="-4.999996875" y2="1.15" width="0.2032" layer="21"/>
<pad name="2" x="-3.75" y="0" drill="0.7" diameter="1.1"/>
<pad name="3" x="-2.249996875" y="0" drill="0.7" diameter="1.1"/>
<pad name="4" x="-0.75" y="0" drill="0.7" diameter="1.1"/>
<pad name="5" x="0.749996875" y="0" drill="0.7" diameter="1.1"/>
<text x="-6.29" y="1.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.29" y="-3.5" size="1.27" layer="27">&gt;VALUE</text>
<pad name="6" x="2.24999375" y="0" drill="0.7" diameter="1.1"/>
<pad name="1" x="-5.249996875" y="0" drill="0.7" diameter="1.1" shape="square"/>
<pad name="7" x="3.749996875" y="0" drill="0.7" diameter="1.1"/>
<pad name="8" x="5.249996875" y="0" drill="0.7" diameter="1.1"/>
</package>
</packages>
<symbols>
<symbol name="PM-VN-RIGHT">
<wire x1="0.254" y1="0" x2="-1.524" y2="0" width="0.4064" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-4.064" y="1.524" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
</symbol>
<symbol name="PM-N-RIGHT">
<wire x1="0.254" y1="0" x2="-1.524" y2="0" width="0.4064" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SQT-104-01-L-S" prefix="J">
<gates>
<gate name="-1" symbol="PM-VN-RIGHT" x="5.08" y="5.08" addlevel="always"/>
<gate name="-2" symbol="PM-N-RIGHT" x="5.08" y="2.54" addlevel="always"/>
<gate name="-3" symbol="PM-N-RIGHT" x="5.08" y="0" addlevel="always"/>
<gate name="-4" symbol="PM-N-RIGHT" x="5.08" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="THD-SQT-104-01-L-S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="SQT-104-01-L-S" constant="no"/>
<attribute name="OC_FARNELL" value="1668155" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="S4B-ZR" prefix="J">
<gates>
<gate name="-1" symbol="PM-VN-RIGHT" x="5.08" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="PM-N-RIGHT" x="5.08" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="PM-N-RIGHT" x="5.08" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="PM-N-RIGHT" x="5.08" y="0" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="S4B-ZR">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="S4B-ZR" constant="no"/>
<attribute name="OC_FARNELL" value="9491830" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="S3B-ZR" prefix="J">
<description>&lt;h4&gt;S3B-ZR&lt;/h4&gt;
&lt;hr&gt;
JST connector 3way&lt;br/&gt;&lt;br/&gt;
&lt;a href="http://www.farnell.com/datasheets/80556.pdf"&gt;Datasheet&lt;/a&gt;</description>
<gates>
<gate name="-1" symbol="PM-VN-RIGHT" x="5.08" y="2.54" addlevel="always"/>
<gate name="-2" symbol="PM-N-RIGHT" x="5.08" y="0" addlevel="always"/>
<gate name="-3" symbol="PM-N-RIGHT" x="5.08" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="S3B-ZR">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="S3B-ZR" constant="no"/>
<attribute name="OC_FARNELL" value="9491821" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="B8B-ZR" prefix="J">
<description>&lt;h4&gt;B8B-ZR&lt;/h4&gt;
&lt;hr&gt;
&lt;p&gt;
JST connector 8 way vertical&lt;br/&gt;
1.5mm pitch spacing
&lt;/p&gt;
&lt;p&gt;
&lt;a href="http://www.farnell.com/datasheets/621906.pdf"&gt;Datasheet&lt;/a&gt;</description>
<gates>
<gate name="-1" symbol="PM-VN-RIGHT" x="5.08" y="7.62" addlevel="always"/>
<gate name="-2" symbol="PM-N-RIGHT" x="5.08" y="5.08" addlevel="always"/>
<gate name="-3" symbol="PM-N-RIGHT" x="5.08" y="2.54" addlevel="always"/>
<gate name="-4" symbol="PM-N-RIGHT" x="5.08" y="0" addlevel="always"/>
<gate name="-5" symbol="PM-N-RIGHT" x="5.08" y="-2.54" addlevel="always"/>
<gate name="-6" symbol="PM-N-RIGHT" x="5.08" y="-5.08" addlevel="always"/>
<gate name="-7" symbol="PM-N-RIGHT" x="5.08" y="-7.62" addlevel="always"/>
<gate name="-8" symbol="PM-N-RIGHT" x="5.08" y="-10.16" addlevel="always"/>
</gates>
<devices>
<device name="" package="B8B-ZR">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
<connect gate="-8" pin="1" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="B8B-ZR" constant="no"/>
<attribute name="OC_FARNELL" value="1830904" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_fusibles">
<description>Fusibles</description>
<packages>
<package name="1206">
<description>&lt;b&gt;Package 1206&lt;/b&gt;</description>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
<wire x1="-2.54" y1="0.983" x2="2.54" y2="0.983" width="0.127" layer="21"/>
<wire x1="2.54" y1="0.983" x2="2.54" y2="-0.983" width="0.127" layer="21"/>
<wire x1="2.54" y1="-0.983" x2="-2.54" y2="-0.983" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.983" x2="-2.54" y2="0.983" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="FUSE">
<wire x1="-2.794" y1="-0.762" x2="2.794" y2="-0.762" width="0.254" layer="94"/>
<wire x1="2.794" y1="0.762" x2="-2.794" y2="0.762" width="0.254" layer="94"/>
<wire x1="2.794" y1="-0.762" x2="2.794" y2="0.762" width="0.254" layer="94"/>
<wire x1="-2.794" y1="0.762" x2="-2.794" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.524" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0" x2="0" y2="0" width="0.1524" layer="94" curve="92.795489"/>
<wire x1="1.524" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="1.524" y1="0" x2="0" y2="0" width="0.1524" layer="94" curve="92.795489"/>
<text x="-3.81" y="1.397" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-2.921" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SMDC050F-*" prefix="F">
<description>&lt;b&gt;PolySwitch (TM) Resettable Device&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.farnell.com/datasheets/68397.pdf"&gt;Data sheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="FUSE" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="0.5A-">
<attribute name="MPN" value="NANOSMDC050F/13.2" constant="no"/>
<attribute name="OC_FARNELL" value="134-5942" constant="no"/>
<attribute name="OC_RS" value="138-679" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_condensador_polarizado">
<packages>
<package name="3528-21">
<smd name="POS" x="-1.7272" y="0" dx="1.524" dy="2.286" layer="1"/>
<smd name="NEG" x="1.7272" y="0" dx="1.524" dy="2.286" layer="1"/>
<wire x1="-1.7526" y1="-1.397" x2="1.7526" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="1.7526" y1="-1.397" x2="1.7526" y2="1.397" width="0.2032" layer="51"/>
<wire x1="1.7526" y1="1.397" x2="-1.7526" y2="1.397" width="0.2032" layer="21"/>
<wire x1="-1.7526" y1="1.397" x2="-1.7526" y2="-1.397" width="0.2032" layer="51"/>
<text x="-2.54" y="1.905" size="1.27" layer="25" ratio="2">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27" ratio="2">&gt;VALUE</text>
<wire x1="-0.635" y1="1.2573" x2="-0.635" y2="-1.2573" width="0.508" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="CPOL">
<description>Condensador Polarizado</description>
<pin name="POS" x="-5.08" y="0" visible="off" length="short"/>
<pin name="NEG" x="2.54" y="0" visible="off" length="short" rot="R180"/>
<text x="-2.54" y="3.302" size="1.016" layer="95">&gt;NAME</text>
<text x="-2.54" y="-4.064" size="1.016" layer="96">&gt;VALUE</text>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="-4.572" y="0.762" size="1.778" layer="94">+</text>
<text x="-2.54" y="-5.588" size="1.016" layer="96">&gt;VOLTAGE</text>
<text x="-2.54" y="-7.112" size="1.016" layer="96">&gt;TOLERANCE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="C293D" prefix="C" uservalue="yes">
<description>Condensador</description>
<gates>
<gate name="G$1" symbol="CPOL" x="5.08" y="0"/>
</gates>
<devices>
<device name="B" package="3528-21">
<connects>
<connect gate="G$1" pin="NEG" pad="NEG"/>
<connect gate="G$1" pin="POS" pad="POS"/>
</connects>
<technologies>
<technology name="100U-6V3-10%-">
<attribute name="MPN" value="293D107X96R3B2TE3" constant="no"/>
<attribute name="OC_FARNELL" value="175-4153" constant="no"/>
<attribute name="OC_RS" value="684-3932" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="100uF" constant="no"/>
<attribute name="VOLTAGE" value="6.3V" constant="no"/>
</technology>
<technology name="10U-10V-10%-">
<attribute name="MPN" value="293D106X9010B2TE3" constant="no"/>
<attribute name="OC_FARNELL" value="175-4163" constant="no"/>
<attribute name="OC_RS" value="684-3888" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="10uF" constant="no"/>
<attribute name="VOLTAGE" value="10V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_memorias">
<packages>
<package name="TSOP54-400">
<description>&lt;b&gt;54-Pin Plastic TSOP&lt;/b&gt; (400 mil)&lt;p&gt;
Source: http://download.micron.com/pdf/datasheets/dram/sdram/256MSDRAM.pdf</description>
<wire x1="-11.0084" y1="1.4" x2="-11.0084" y2="3.4" width="0.2032" layer="21" curve="180"/>
<wire x1="11.0084" y1="-4.9784" x2="11.0084" y2="4.9784" width="0.2032" layer="21"/>
<wire x1="11.0084" y1="4.9784" x2="-11.0084" y2="4.9784" width="0.2032" layer="21"/>
<wire x1="-11.0084" y1="4.9784" x2="-11.0084" y2="3.4" width="0.2032" layer="21"/>
<wire x1="-11.0084" y1="3.4" x2="-11.0084" y2="1.4" width="0.2032" layer="21"/>
<wire x1="-11.0084" y1="1.4" x2="-11.0084" y2="-4.9784" width="0.2032" layer="21"/>
<wire x1="-11.0084" y1="-4.9784" x2="11.0084" y2="-4.9784" width="0.2032" layer="21"/>
<circle x="-10.4" y="-4.4" radius="0.4" width="0" layer="21"/>
<smd name="1" x="-10.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="2" x="-9.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="3" x="-8.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="4" x="-8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="5" x="-7.2" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="6" x="-6.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="7" x="-5.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="8" x="-4.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="9" x="-4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="10" x="-3.2" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="11" x="-2.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="12" x="-1.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="13" x="-0.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="14" x="0" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="15" x="0.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="16" x="1.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="17" x="2.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="18" x="3.2" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="19" x="4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="20" x="4.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="21" x="5.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="22" x="6.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="23" x="7.2" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="24" x="8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="25" x="8.8" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="26" x="9.6" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="27" x="10.4" y="-5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="28" x="10.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R270"/>
<smd name="29" x="9.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="30" x="8.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="31" x="8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="32" x="7.2" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="33" x="6.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="34" x="5.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="35" x="4.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="36" x="4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="37" x="3.2" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="38" x="2.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="39" x="1.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="40" x="0.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="41" x="0" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="42" x="-0.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="43" x="-1.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="44" x="-2.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="45" x="-3.2" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="46" x="-4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="47" x="-4.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="48" x="-5.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="49" x="-6.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="50" x="-7.2" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="51" x="-8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="52" x="-8.8" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="53" x="-9.6" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<smd name="54" x="-10.4" y="5.68" dx="0.9" dy="0.4" layer="1" rot="R90"/>
<text x="-11.6" y="-4.8" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-6" y="-0.4" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-10.8" y1="-5.6675" x2="-10" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-10" y1="-5.6675" x2="-9.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-9.2" y1="-5.6675" x2="-8.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-8.4" y1="-5.6675" x2="-7.6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-7.6" y1="-5.6675" x2="-6.8" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-6.8" y1="-5.6675" x2="-6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-6" y1="-5.6675" x2="-5.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-5.2" y1="-5.6675" x2="-4.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-4.4" y1="-5.6675" x2="-3.6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-3.6" y1="-5.6675" x2="-2.8" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-2.8" y1="-5.6675" x2="-2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-2" y1="-5.6675" x2="-1.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-1.2" y1="-5.6675" x2="-0.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="-0.4" y1="-5.6675" x2="0.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="0.4" y1="-5.6675" x2="1.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="1.2" y1="-5.6675" x2="2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="2" y1="-5.6675" x2="2.8" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="2.8" y1="-5.6675" x2="3.6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="3.6" y1="-5.6675" x2="4.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="4.4" y1="-5.6675" x2="5.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="5.2" y1="-5.6675" x2="6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="6" y1="-5.6675" x2="6.8" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="6.8" y1="-5.6675" x2="7.6" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="7.6" y1="-5.6675" x2="8.4" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="8.4" y1="-5.6675" x2="9.2" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="9.2" y1="-5.6675" x2="10" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="10" y1="-5.6675" x2="10.8" y2="-5.2925" layer="51" rot="R90"/>
<rectangle x1="10" y1="5.2925" x2="10.8" y2="5.6675" layer="51" rot="R270"/>
<rectangle x1="9.2" y1="5.2925" x2="10" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="8.4" y1="5.2925" x2="9.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="7.6" y1="5.2925" x2="8.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="6.8" y1="5.2925" x2="7.6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="6" y1="5.2925" x2="6.8" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="5.2" y1="5.2925" x2="6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="4.4" y1="5.2925" x2="5.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="3.6" y1="5.2925" x2="4.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="2.8" y1="5.2925" x2="3.6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="2" y1="5.2925" x2="2.8" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="1.2" y1="5.2925" x2="2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="0.4" y1="5.2925" x2="1.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-0.4" y1="5.2925" x2="0.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-1.2" y1="5.2925" x2="-0.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-2" y1="5.2925" x2="-1.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-2.8" y1="5.2925" x2="-2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-3.6" y1="5.2925" x2="-2.8" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-4.4" y1="5.2925" x2="-3.6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-5.2" y1="5.2925" x2="-4.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-6" y1="5.2925" x2="-5.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-6.8" y1="5.2925" x2="-6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-7.6" y1="5.2925" x2="-6.8" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-8.4" y1="5.2925" x2="-7.6" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-9.2" y1="5.2925" x2="-8.4" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-10" y1="5.2925" x2="-9.2" y2="5.6675" layer="51" rot="R90"/>
<rectangle x1="-10.8" y1="5.2925" x2="-10" y2="5.6675" layer="51" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="MT48LC16M16A2">
<wire x1="-10.16" y1="40.64" x2="12.7" y2="40.64" width="0.254" layer="94"/>
<wire x1="12.7" y1="40.64" x2="12.7" y2="-43.18" width="0.254" layer="94"/>
<wire x1="12.7" y1="-43.18" x2="-10.16" y2="-43.18" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-43.18" x2="-10.16" y2="40.64" width="0.254" layer="94"/>
<text x="-10.16" y="41.91" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-45.72" size="1.778" layer="96">&gt;VALUE</text>
<pin name="CLK" x="-12.7" y="-30.48" length="short" function="clk"/>
<pin name="CKE" x="-12.7" y="-27.94" length="short"/>
<pin name="!CS" x="-12.7" y="-20.32" length="short"/>
<pin name="!WE" x="-12.7" y="-12.7" length="short"/>
<pin name="!CAS" x="-12.7" y="-15.24" length="short"/>
<pin name="!RAS" x="-12.7" y="-17.78" length="short"/>
<pin name="DQML" x="-12.7" y="-5.08" length="short"/>
<pin name="DQMH" x="-12.7" y="-7.62" length="short"/>
<pin name="BA0" x="-12.7" y="2.54" length="short"/>
<pin name="BA1" x="-12.7" y="0" length="short"/>
<pin name="A0" x="-12.7" y="38.1" length="short"/>
<pin name="A1" x="-12.7" y="35.56" length="short"/>
<pin name="A2" x="-12.7" y="33.02" length="short"/>
<pin name="A3" x="-12.7" y="30.48" length="short"/>
<pin name="A4" x="-12.7" y="27.94" length="short"/>
<pin name="A5" x="-12.7" y="25.4" length="short"/>
<pin name="A6" x="-12.7" y="22.86" length="short"/>
<pin name="A7" x="-12.7" y="20.32" length="short"/>
<pin name="A8" x="-12.7" y="17.78" length="short"/>
<pin name="A9" x="-12.7" y="15.24" length="short"/>
<pin name="A10" x="-12.7" y="12.7" length="short"/>
<pin name="A11" x="-12.7" y="10.16" length="short"/>
<pin name="A12" x="-12.7" y="7.62" length="short"/>
<pin name="DQ0" x="15.24" y="38.1" length="short" rot="R180"/>
<pin name="DQ1" x="15.24" y="35.56" length="short" rot="R180"/>
<pin name="DQ2" x="15.24" y="33.02" length="short" rot="R180"/>
<pin name="DQ3" x="15.24" y="30.48" length="short" rot="R180"/>
<pin name="DQ15" x="15.24" y="0" length="short" rot="R180"/>
<pin name="NC" x="-12.7" y="-35.56" length="short"/>
<pin name="DQ4" x="15.24" y="27.94" length="short" rot="R180"/>
<pin name="DQ5" x="15.24" y="25.4" length="short" rot="R180"/>
<pin name="DQ6" x="15.24" y="22.86" length="short" rot="R180"/>
<pin name="DQ7" x="15.24" y="20.32" length="short" rot="R180"/>
<pin name="DQ8" x="15.24" y="17.78" length="short" rot="R180"/>
<pin name="DQ9" x="15.24" y="15.24" length="short" rot="R180"/>
<pin name="DQ10" x="15.24" y="12.7" length="short" rot="R180"/>
<pin name="DQ11" x="15.24" y="10.16" length="short" rot="R180"/>
<pin name="DQ12" x="15.24" y="7.62" length="short" rot="R180"/>
<pin name="DQ13" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="DQ14" x="15.24" y="2.54" length="short" rot="R180"/>
<pin name="VDDQ@1" x="15.24" y="-5.08" length="short" rot="R180"/>
<pin name="VDDQ@2" x="15.24" y="-7.62" length="short" rot="R180"/>
<pin name="VDDQ@3" x="15.24" y="-10.16" length="short" rot="R180"/>
<pin name="VDDQ@4" x="15.24" y="-12.7" length="short" rot="R180"/>
<pin name="VDD@1" x="15.24" y="-15.24" length="short" rot="R180"/>
<pin name="VDD@2" x="15.24" y="-17.78" length="short" rot="R180"/>
<pin name="VDD@3" x="15.24" y="-20.32" length="short" rot="R180"/>
<pin name="VSS@1" x="15.24" y="-25.4" length="short" rot="R180"/>
<pin name="VSS@2" x="15.24" y="-27.94" length="short" rot="R180"/>
<pin name="VSS@3" x="15.24" y="-30.48" length="short" rot="R180"/>
<pin name="VSSQ@1" x="15.24" y="-33.02" length="short" rot="R180"/>
<pin name="VSSQ@2" x="15.24" y="-35.56" length="short" rot="R180"/>
<pin name="VSSQ@3" x="15.24" y="-38.1" length="short" rot="R180"/>
<pin name="VSSQ@4" x="15.24" y="-40.64" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MT48LC16M16A2" prefix="U">
<description>&lt;b&gt;256Mb: x16 SDRAM&lt;/b&gt; MT48LC16M16A2 - 4 Meg x 16 x 4 banks&lt;p&gt;
&lt;a href="http://download.micron.com/pdf/datasheets/dram/sdram/256MSDRAM.pdf"&gt;Datasheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="MT48LC16M16A2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TSOP54-400">
<connects>
<connect gate="G$1" pin="!CAS" pad="17"/>
<connect gate="G$1" pin="!CS" pad="19"/>
<connect gate="G$1" pin="!RAS" pad="18"/>
<connect gate="G$1" pin="!WE" pad="16"/>
<connect gate="G$1" pin="A0" pad="23"/>
<connect gate="G$1" pin="A1" pad="24"/>
<connect gate="G$1" pin="A10" pad="22"/>
<connect gate="G$1" pin="A11" pad="35"/>
<connect gate="G$1" pin="A12" pad="36"/>
<connect gate="G$1" pin="A2" pad="25"/>
<connect gate="G$1" pin="A3" pad="26"/>
<connect gate="G$1" pin="A4" pad="29"/>
<connect gate="G$1" pin="A5" pad="30"/>
<connect gate="G$1" pin="A6" pad="31"/>
<connect gate="G$1" pin="A7" pad="32"/>
<connect gate="G$1" pin="A8" pad="33"/>
<connect gate="G$1" pin="A9" pad="34"/>
<connect gate="G$1" pin="BA0" pad="20"/>
<connect gate="G$1" pin="BA1" pad="21"/>
<connect gate="G$1" pin="CKE" pad="37"/>
<connect gate="G$1" pin="CLK" pad="38"/>
<connect gate="G$1" pin="DQ0" pad="2"/>
<connect gate="G$1" pin="DQ1" pad="4"/>
<connect gate="G$1" pin="DQ10" pad="45"/>
<connect gate="G$1" pin="DQ11" pad="47"/>
<connect gate="G$1" pin="DQ12" pad="48"/>
<connect gate="G$1" pin="DQ13" pad="50"/>
<connect gate="G$1" pin="DQ14" pad="51"/>
<connect gate="G$1" pin="DQ15" pad="53"/>
<connect gate="G$1" pin="DQ2" pad="5"/>
<connect gate="G$1" pin="DQ3" pad="7"/>
<connect gate="G$1" pin="DQ4" pad="8"/>
<connect gate="G$1" pin="DQ5" pad="10"/>
<connect gate="G$1" pin="DQ6" pad="11"/>
<connect gate="G$1" pin="DQ7" pad="13"/>
<connect gate="G$1" pin="DQ8" pad="42"/>
<connect gate="G$1" pin="DQ9" pad="44"/>
<connect gate="G$1" pin="DQMH" pad="39"/>
<connect gate="G$1" pin="DQML" pad="15"/>
<connect gate="G$1" pin="NC" pad="40"/>
<connect gate="G$1" pin="VDD@1" pad="1"/>
<connect gate="G$1" pin="VDD@2" pad="14"/>
<connect gate="G$1" pin="VDD@3" pad="27"/>
<connect gate="G$1" pin="VDDQ@1" pad="3"/>
<connect gate="G$1" pin="VDDQ@2" pad="9"/>
<connect gate="G$1" pin="VDDQ@3" pad="43"/>
<connect gate="G$1" pin="VDDQ@4" pad="49"/>
<connect gate="G$1" pin="VSS@1" pad="28"/>
<connect gate="G$1" pin="VSS@2" pad="41"/>
<connect gate="G$1" pin="VSS@3" pad="54"/>
<connect gate="G$1" pin="VSSQ@1" pad="6"/>
<connect gate="G$1" pin="VSSQ@2" pad="12"/>
<connect gate="G$1" pin="VSSQ@3" pad="46"/>
<connect gate="G$1" pin="VSSQ@4" pad="52"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="MT48LC16M16A2P-7E:D" constant="no"/>
<attribute name="OC_FARNELL" value="1216281" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_resistencia_smd">
<packages>
<package name="R0402">
<description>R0402</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.762" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.032" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
</package>
<package name="R0603">
<description>R0603</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51"/>
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1"/>
<text x="-0.889" y="0.889" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.889" y="-2.032" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
<wire x1="-1.524" y1="0.762" x2="1.524" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.524" y1="0.762" x2="1.524" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.524" y1="-0.762" x2="-1.524" y2="-0.762" width="0.127" layer="21"/>
<wire x1="-1.524" y1="-0.762" x2="-1.524" y2="0.762" width="0.127" layer="21"/>
</package>
<package name="R0805">
<description>R0805</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.762" y="1.016" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-2.286" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
<wire x1="-1.973" y1="1.016" x2="1.973" y2="1.016" width="0.127" layer="21"/>
<wire x1="1.973" y1="1.016" x2="1.973" y2="-1.016" width="0.127" layer="21"/>
<wire x1="1.973" y1="-1.016" x2="-1.973" y2="-1.016" width="0.127" layer="21"/>
<wire x1="-1.973" y1="-1.016" x2="-1.973" y2="1.016" width="0.127" layer="21"/>
</package>
<package name="R1206">
<description>R1206</description>
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1524" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.397" y="1.143" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.397" y="-2.413" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<wire x1="-2.54" y1="1.016" x2="2.54" y2="1.016" width="0.127" layer="21"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="-1.016" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="-2.54" y2="-1.016" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.016" x2="-2.54" y2="1.016" width="0.127" layer="21"/>
</package>
<package name="R1210">
<description>R1210</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-1.27" y="1.651" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.921" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8999" x2="0.3" y2="0.8999" layer="35"/>
<wire x1="-2.54" y1="1.524" x2="2.54" y2="1.524" width="0.127" layer="21"/>
<wire x1="2.54" y1="1.524" x2="2.54" y2="-1.524" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.524" x2="-2.54" y2="-1.524" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.524" x2="-2.54" y2="1.524" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="R">
<description>Restistencia</description>
<pin name="P$1" x="-5.08" y="0" visible="off" length="short"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
<wire x1="-2.54" y1="-1.016" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.016" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.016" x2="-2.54" y2="-1.016" width="0.254" layer="94"/>
<text x="-5.08" y="1.524" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="-2.794" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="R_TF-" prefix="R">
<description>Resistor</description>
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="0402" package="R0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="0R-0.0625W-0.05%-">
<attribute name="OC_FARNELL" value="2073956" constant="no"/>
<attribute name="OC_RS" value="" constant="no"/>
<attribute name="POWER" value="62.5mW" constant="no"/>
<attribute name="TOLERANCE" value="0.05%" constant="no"/>
<attribute name="VALUE" value="0R" constant="no"/>
</technology>
<technology name="100K-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738877" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="100K" constant="no"/>
</technology>
<technology name="10K-0.0625W-0.1%-">
<attribute name="OC_FARNELL" value="1108808" constant="no"/>
<attribute name="OC_RS" value="701-5024" constant="no"/>
<attribute name="POWER" value="63mW" constant="no"/>
<attribute name="TOLERANCE" value="0.1%" constant="no"/>
<attribute name="VALUE" value="10K" constant="no"/>
</technology>
<technology name="10K-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738864" constant="no"/>
<attribute name="OC_RS" value="678-4697" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="10K" constant="no"/>
</technology>
<technology name="120R-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738838" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="120R" constant="no"/>
</technology>
<technology name="1K-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738850" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="1K" constant="no"/>
</technology>
<technology name="1K5-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738852" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="1K5" constant="no"/>
</technology>
<technology name="200K-0.1W-1%-">
<attribute name="OC_FARNELL" value="2059185" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="200K" constant="no"/>
</technology>
<technology name="4K7-0.125W-1%-">
<attribute name="OC_FARNELL" value="1738858" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="4K7" constant="no"/>
</technology>
<technology name="68R-0.063W-5%-">
<attribute name="OC_FARNELL" value="1739078" constant="no"/>
<attribute name="OC_RS" value="678-9535" constant="no"/>
<attribute name="POWER" value="63mW" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="68R" constant="no"/>
</technology>
</technologies>
</device>
<device name="0603" package="R0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="100K-0.1W-5%-">
<attribute name="OC_FARNELL" value="200-8366" constant="no"/>
<attribute name="OC_RS" value="740-8896" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="100K" constant="no"/>
</technology>
<technology name="1K-0.1W-1%-">
<attribute name="OC_FARNELL" value="200-8335" constant="no"/>
<attribute name="OC_RS" value="740-8791" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="1K" constant="no"/>
</technology>
<technology name="2M4-0.1W-1%-">
<attribute name="OC_FARNELL" value="213-8651" constant="no"/>
<attribute name="OC_RS" value="679-0175" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="2M4" constant="no"/>
</technology>
<technology name="402K-0.063W-1%-">
<attribute name="OC_FARNELL" value="117-1046" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="63mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="402K" constant="no"/>
</technology>
<technology name="470K-0.2W-1%-">
<attribute name="OC_FARNELL" value="175-0709" constant="no"/>
<attribute name="OC_RS" value="721-7555" constant="no"/>
<attribute name="POWER" value="200mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="470K" constant="no"/>
</technology>
<technology name="560R-0.2W-1%-">
<attribute name="OC_FARNELL" value="175-0669" constant="no"/>
<attribute name="OC_RS" value="721-7328" constant="no"/>
<attribute name="POWER" value="200mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="560R" constant="no"/>
</technology>
<technology name="62R-0.1W-0.1%-">
<attribute name="OC_FARNELL" value="167-0160" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="0.1%" constant="no"/>
<attribute name="VALUE" value="62R" constant="no"/>
</technology>
<technology name="7K5-0.063W-1%-">
<attribute name="OC_FARNELL" value="152-7568" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="63mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="7K5" constant="no"/>
</technology>
<technology name="7K5-0.1W-1%-">
<attribute name="OC_FARNELL" value="-" constant="no"/>
<attribute name="OC_RS" value="679-0702" constant="no"/>
<attribute name="POWER" value="100Mw" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="7K5" constant="no"/>
</technology>
<technology name="8M2-0.1W-1%-">
<attribute name="OC_FARNELL" value="923-8956" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="8M2" constant="no"/>
</technology>
</technologies>
</device>
<device name="0805" package="R0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="100K-0.250W-5%-">
<attribute name="OC_FARNELL" value="161-8243" constant="no"/>
<attribute name="OC_RS" value="721-7094" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="100K" constant="no"/>
</technology>
<technology name="10K-0.125W-1%-">
<attribute name="OC_FARNELL" value="200-8384" constant="no"/>
<attribute name="OC_RS" value="740-8975" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="10K" constant="no"/>
</technology>
<technology name="120R-0.125W-1%-">
<attribute name="OC_FARNELL" value="200-8371" constant="no"/>
<attribute name="OC_RS" value="223-0304" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="120R" constant="no"/>
</technology>
<technology name="16K2-0.1W-0.1%-">
<attribute name="OC_FARNELL" value="157-5962" constant="no"/>
<attribute name="OC_RS" value="708-6486" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="0.1%" constant="no"/>
<attribute name="VALUE" value="16K2" constant="no"/>
</technology>
<technology name="1M-0.125W-1%-">
<attribute name="OC_FARNELL" value="165-2946" constant="no"/>
<attribute name="OC_RS" value="679-1049" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="1M" constant="no"/>
</technology>
<technology name="22K-0.250W-1%-">
<attribute name="OC_FARNELL" value="175-0774" constant="no"/>
<attribute name="OC_RS" value="721-7854" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="22K" constant="no"/>
</technology>
<technology name="240R-0.250W-1%-">
<attribute name="OC_FARNELL" value="189-4176" constant="no"/>
<attribute name="OC_RS" value="721-7690" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="240R" constant="no"/>
</technology>
<technology name="26K1-0.1W-0.1%-">
<attribute name="OC_FARNELL" value="157-5951" constant="no"/>
<attribute name="OC_RS" value="708-6547" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="0.1%" constant="no"/>
<attribute name="VALUE" value="26K1" constant="no"/>
</technology>
<technology name="2K2-0.125W-1%-">
<attribute name="OC_FARNELL" value="146-9887" constant="no"/>
<attribute name="OC_RS" value="223-0477" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="2K2" constant="no"/>
</technology>
<technology name="2K7-0.125W-1%-">
<attribute name="OC_FARNELL" value="146-9891" constant="no"/>
<attribute name="OC_RS" value="223-0483" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="2K7" constant="no"/>
</technology>
<technology name="330R-0.125W-1%-">
<attribute name="OC_FARNELL" value="146-9918" constant="no"/>
<attribute name="OC_RS" value="223-0354" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="330R" constant="no"/>
</technology>
<technology name="3K6-0.250W-1%-">
<attribute name="OC_FARNELL" value="189-4191" constant="no"/>
<attribute name="OC_RS" value="721-7794" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="3K6" constant="no"/>
</technology>
<technology name="3K9-0.125W-1%-">
<attribute name="OC_FARNELL" value="165-2998" constant="no"/>
<attribute name="OC_RS" value="223-0506" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="3K9" constant="no"/>
</technology>
<technology name="402K-0.1W-0.1%-">
<attribute name="OC_FARNELL" value="116-0288" constant="no"/>
<attribute name="OC_RS" value="708-6907" constant="no"/>
<attribute name="POWER" value="100mW" constant="no"/>
<attribute name="TOLERANCE" value="0.1%" constant="no"/>
<attribute name="VALUE" value="402K" constant="no"/>
</technology>
<technology name="470R-0.125W-1%-">
<attribute name="OC_FARNELL" value="200-8377" constant="no"/>
<attribute name="OC_RS" value="223-0376" constant="no"/>
<attribute name="POWER" value="125mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="470R" constant="no"/>
</technology>
<technology name="47K-0.25W-1%-">
<attribute name="OC_FARNELL" value="175-0778" constant="no"/>
<attribute name="OC_RS" value="223-0641" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="47K" constant="no"/>
</technology>
<technology name="91K-0.25W-1%-">
<attribute name="OC_FARNELL" value="189-4210" constant="no"/>
<attribute name="OC_RS" value="721-7905" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="91K" constant="no"/>
</technology>
</technologies>
</device>
<device name="1206" package="R1206">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="27R-0.25W-1%-">
<attribute name="OC_FARNELL" value="9236694" constant="no"/>
<attribute name="OC_RS" value="223-2057" constant="no"/>
<attribute name="POWER" value="250mW" constant="no"/>
<attribute name="TOLERANCE" value="1%" constant="no"/>
<attribute name="VALUE" value="27R" constant="no"/>
</technology>
</technologies>
</device>
<device name="1210" package="R1210">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="12R-0.5W-5%-">
<attribute name="OC_FARNELL" value="-" constant="no"/>
<attribute name="OC_RS" value="721-9260" constant="no"/>
<attribute name="POWER" value="500mW" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="12R" constant="no"/>
</technology>
<technology name="3R9-0.5W-5%-">
<attribute name="OC_FARNELL" value="1577483" constant="no"/>
<attribute name="OC_RS" value="722-0816" constant="no"/>
<attribute name="POWER" value="500mW" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="3R9" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_condensador">
<description>Condensadores no polarizados</description>
<packages>
<package name="C0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="-1.27" y1="0.635" x2="1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
</package>
<package name="C0603">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="-1.52" y1="0.76" x2="1.52" y2="0.76" width="0.127" layer="21"/>
<wire x1="1.52" y1="0.76" x2="1.52" y2="-0.76" width="0.127" layer="21"/>
<wire x1="1.52" y1="-0.76" x2="-1.52" y2="-0.76" width="0.127" layer="21"/>
<wire x1="-1.52" y1="-0.76" x2="-1.52" y2="0.76" width="0.127" layer="21"/>
</package>
<package name="C0805">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
<wire x1="-2" y1="1.015" x2="2" y2="1.015" width="0.127" layer="21"/>
<wire x1="-2" y1="1.015" x2="-2" y2="-1.015" width="0.127" layer="21"/>
<wire x1="2" y1="1.015" x2="2" y2="-1.015" width="0.127" layer="21"/>
<wire x1="-2" y1="-1.015" x2="2" y2="-1.015" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="C">
<pin name="P$1" x="-2.54" y="0" visible="off" length="point"/>
<pin name="P$2" x="2.54" y="0" visible="off" length="point" rot="R180"/>
<rectangle x1="0.508" y1="-2.54" x2="1.016" y2="2.54" layer="94"/>
<text x="-2.54" y="2.794" size="1.27" layer="95" ratio="3">&gt;NAME</text>
<text x="1.27" y="-1.524" size="1.27" layer="96" ratio="3">&gt;VALUE</text>
<rectangle x1="-1.016" y1="-2.54" x2="-0.508" y2="2.54" layer="94"/>
<wire x1="2.54" y1="0" x2="1.016" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.762" y2="0" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C_TF-" prefix="C">
<gates>
<gate name="G$1" symbol="C" x="2.54" y="0"/>
</gates>
<devices>
<device name="0402" package="C0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="100N-25V-">
<attribute name="OC_FARNELL" value="1867948" constant="no"/>
<attribute name="OC_RS" value="723-5174" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="100nF" constant="no"/>
<attribute name="VOLTAGE" value="25V" constant="no"/>
</technology>
<technology name="100N-6V3-">
<attribute name="OC_FARNELL" value="1327657" constant="no"/>
<attribute name="OC_RS" value="698-3162" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="100nF" constant="no"/>
<attribute name="VOLTAGE" value="6.3V" constant="no"/>
</technology>
<technology name="10N-16V-">
<attribute name="OC_FARNELL" value="3019275" constant="no"/>
<attribute name="OC_RS" value="723-5225" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="10nF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="1N-16V-">
<attribute name="OC_FARNELL" value="1327660" constant="no"/>
<attribute name="OC_RS" value=" 698-3178" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="1nF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="1U-16V-">
<attribute name="OC_FARNELL" value="2112701" constant="no"/>
<attribute name="OC_RS" value="741-4409" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="1uF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="1U-6.3V-">
<attribute name="OC_FARNELL" value="1845729" constant="no"/>
<attribute name="OC_RS" value="723-5180" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="1uF" constant="no"/>
<attribute name="VOLTAGE" value="6.3V" constant="no"/>
</technology>
<technology name="22P-50V-">
<attribute name="OC_FARNELL" value="8819629" constant="no"/>
<attribute name="OC_RS" value="624-2187" constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="22pF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
<technology name="33N-25V-">
<attribute name="OC_FARNELL" value="1865445" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="33nF" constant="no"/>
<attribute name="VOLTAGE" value="25V" constant="no"/>
</technology>
<technology name="470P-50V-">
<attribute name="OC_FARNELL" value="1414593" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="470pF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
</technologies>
</device>
<device name="0603" package="C0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="100N-25V-">
<attribute name="OC_FARNELL" value="1740614" constant="no"/>
<attribute name="OC_RS" value="723-5638" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="100nF" constant="no"/>
<attribute name="VOLTAGE" value="25V" constant="no"/>
</technology>
<technology name="22P-50V-">
<attribute name="OC_FARNELL" value="1414622" constant="no"/>
<attribute name="OC_RS" value="624-2351 " constant="no"/>
<attribute name="TOLERANCE" value="5%" constant="no"/>
<attribute name="VALUE" value="22pF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
<technology name="2U2-10V-">
<attribute name="OC_FARNELL" value="1833808" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="2.2uF" constant="no"/>
<attribute name="VOLTAGE" value="10V" constant="no"/>
</technology>
<technology name="2U2-16V-">
<attribute name="OC_FARNELL" value="1458901" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="80%" constant="no"/>
<attribute name="VALUE" value="2.2uF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="470P-50V-">
<attribute name="OC_FARNELL" value="1520287" constant="no"/>
<attribute name="OC_RS" value="723-5714" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="470pF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
</technologies>
</device>
<device name="0805" package="C0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name="0U1-50V-">
<attribute name="OC_FARNELL" value="1250641" constant="no"/>
<attribute name="OC_RS" value="264-4422" constant="no"/>
<attribute name="TOLERANCE" value="20%" constant="no"/>
<attribute name="VALUE" value="0.1uF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
<technology name="100N-100V-">
<attribute name="OC_FARNELL" value="1833888" constant="no"/>
<attribute name="OC_RS" value="698-3361" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="100nF" constant="no"/>
<attribute name="VOLTAGE" value="100V" constant="no"/>
</technology>
<technology name="10N-100V-">
<attribute name="OC_FARNELL" value="1833850" constant="no"/>
<attribute name="OC_RS" value="698-3352" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="10nF" constant="no"/>
<attribute name="VOLTAGE" value="100V" constant="no"/>
</technology>
<technology name="10U-25V-">
<attribute name="OC_FARNELL" value="1867958" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="10uF" constant="no"/>
<attribute name="VOLTAGE" value="25V" constant="no"/>
</technology>
<technology name="1N-50V-">
<attribute name="OC_FARNELL" value="1828945 " constant="no"/>
<attribute name="OC_RS" value="723-6149" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="1nF" constant="no"/>
<attribute name="VOLTAGE" value="50V" constant="no"/>
</technology>
<technology name="1U-16V-">
<attribute name="OC_FARNELL" value="9227792" constant="no"/>
<attribute name="OC_RS" value="451-5770" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="1uF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="22U-10V-">
<attribute name="OC_FARNELL" value="1867956" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
<attribute name="TOLERANCE" value="20%" constant="no"/>
<attribute name="VALUE" value="22uF" constant="no"/>
<attribute name="VOLTAGE" value="10V" constant="no"/>
</technology>
<technology name="4U7-16V-">
<attribute name="OC_FARNELL" value="1845746" constant="no"/>
<attribute name="OC_RS" value="" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="4.7uF" constant="no"/>
<attribute name="VOLTAGE" value="16V" constant="no"/>
</technology>
<technology name="4U7-25V-">
<attribute name="OC_FARNELL" value="2112757" constant="no"/>
<attribute name="OC_RS" value="698-3403" constant="no"/>
<attribute name="TOLERANCE" value="10%" constant="no"/>
<attribute name="VALUE" value="4.7uF" constant="no"/>
<attribute name="VOLTAGE" value="100V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_holes">
<packages>
<package name="2,8">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 2.8 mm with drill center</description>
<wire x1="-1.778" y1="0" x2="0" y2="-1.778" width="2.286" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.778" x2="1.778" y2="0" width="2.286" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.635" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="40"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="39"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="41"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="42"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="43"/>
<circle x="0" y="0" radius="1.5" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="2.8"/>
</package>
<package name="3,0">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.0 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.6" width="0.2032" layer="21"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,0</text>
<hole x="0" y="0" drill="3"/>
</package>
<package name="3,3">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.3 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.54" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.54" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.75" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.3"/>
</package>
<package name="3,6">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.6 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.7686" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.7686" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.9" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.6"/>
</package>
<package name="4,1">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.1 mm with drill center</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="39"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="40"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.15" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="4.1"/>
</package>
<package name="4,5">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.5 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="3.8184" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.35" width="0.1524" layer="21"/>
<text x="-1.27" y="-4.445" size="1.27" layer="48">4,5</text>
<hole x="0" y="0" drill="4.5"/>
</package>
<package name="5,0">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 5.0 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="43"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="42"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="41"/>
<circle x="0" y="0" radius="2.6" width="0.1524" layer="21"/>
<text x="-1.27" y="-4.445" size="1.27" layer="48">5,0</text>
<hole x="0" y="0" drill="5"/>
</package>
<package name="3,2">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.2 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.7" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.2"/>
</package>
<package name="4,3">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.3 mm with drill center</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="3.8184" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.25" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="4.3"/>
</package>
<package name="5,5">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 5.5 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="43"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="42"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="41"/>
<circle x="0" y="0" radius="2.85" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="5.5"/>
</package>
<package name="1,5">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 2.8 mm with drill center</description>
<wire x1="-1.016" y1="0" x2="0" y2="-1.016" width="1.016" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.016" x2="1.016" y2="0" width="1.016" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.3556" width="0.3048" layer="51"/>
<circle x="0" y="0" radius="1.564821875" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.143" width="0.9144" layer="40"/>
<circle x="0" y="0" radius="1.143" width="0.9144" layer="39"/>
<circle x="0" y="0" radius="1.143" width="0.9144" layer="41"/>
<circle x="0" y="0" radius="1.143" width="0.9144" layer="42"/>
<circle x="0" y="0" radius="1.143" width="0.9144" layer="43"/>
<circle x="0" y="0" radius="0.803571875" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="1.6"/>
<circle x="0" y="0" radius="1.564821875" width="0.1524" layer="22"/>
<circle x="0" y="0" radius="0.803571875" width="0.2032" layer="22"/>
</package>
</packages>
<symbols>
<symbol name="MOUNT-HOLE">
<wire x1="0" y1="1.27" x2="1.27" y2="0" width="1.524" layer="94" curve="-90" cap="flat"/>
<wire x1="-1.27" y1="0" x2="0" y2="-1.27" width="1.524" layer="94" curve="90" cap="flat"/>
<wire x1="-0.508" y1="0" x2="0.508" y2="0" width="0.0508" layer="94"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.0508" layer="94"/>
<circle x="0" y="0" radius="2.032" width="0.0508" layer="94"/>
<circle x="0" y="0" radius="0.508" width="0.0508" layer="94"/>
<text x="2.032" y="0.5842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.032" y="-2.4638" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOUNT-HOLE" prefix="H">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; with drill center marker</description>
<gates>
<gate name="G$1" symbol="MOUNT-HOLE" x="0" y="0"/>
</gates>
<devices>
<device name="2.8" package="2,8">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.0" package="3,0">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.3" package="3,3">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.6" package="3,6">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.1" package="4,1">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.5" package="4,5">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.0" package="5,0">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.2" package="3,2">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.3" package="4,3">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.5" package="5,5">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1.5" package="1,5">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_diode">
<packages>
<package name="SOD323">
<smd name="A" x="0.8001" y="0" dx="0.635" dy="0.8382" layer="1"/>
<smd name="C" x="-0.8001" y="0" dx="0.635" dy="0.8382" layer="1"/>
<wire x1="-1.27" y1="0.635" x2="1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.0762" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.381" width="0.0762" layer="21"/>
<wire x1="0.254" y1="0.381" x2="-0.127" y2="0" width="0.0762" layer="21"/>
<wire x1="-0.127" y1="0" x2="0.254" y2="-0.381" width="0.0762" layer="21"/>
<wire x1="0.254" y1="-0.381" x2="0.254" y2="0" width="0.0762" layer="21"/>
<wire x1="-0.1778" y1="0.381" x2="-0.1778" y2="0" width="0.0762" layer="21"/>
<wire x1="-0.1778" y1="0" x2="-0.1778" y2="-0.381" width="0.0762" layer="21"/>
<wire x1="-0.1778" y1="0" x2="-0.3556" y2="0" width="0.0762" layer="21"/>
<text x="-0.635" y="0.762" size="1.016" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.016" layer="27">&gt;VALUE</text>
</package>
<package name="SMA">
<description>&lt;b&gt;SMA&lt;/b&gt; CASE 403D-02&lt;p&gt;
Source: http://www.onsemi.com/pub_link/Collateral/MBRA340T3-D.PDF</description>
<wire x1="-2.25" y1="1.825" x2="2.25" y2="1.825" width="0.254" layer="21"/>
<wire x1="2.25" y1="-1.825" x2="-2.25" y2="-1.825" width="0.254" layer="21"/>
<wire x1="-2.25" y1="1.825" x2="-2.25" y2="1.25" width="0.254" layer="21"/>
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.254" layer="51"/>
<wire x1="-2.25" y1="-1.825" x2="-2.25" y2="-1.25" width="0.254" layer="21"/>
<wire x1="2.25" y1="-1.825" x2="2.25" y2="-1.25" width="0.254" layer="21" curve="-1.904406"/>
<wire x1="2.25" y1="1.825" x2="2.25" y2="1.25" width="0.254" layer="21"/>
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.254" layer="51"/>
<smd name="C" x="-2" y="0" dx="2" dy="2" layer="1"/>
<smd name="A" x="2" y="0" dx="2" dy="2" layer="1"/>
<text x="-2.75" y="2" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.75" y="-3.5" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.38" y1="-0.825" x2="2.8" y2="0.8" layer="51"/>
<rectangle x1="-2.8" y1="-0.8" x2="-2.38" y2="0.8" layer="51"/>
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="1.75" layer="51"/>
<rectangle x1="-1.5" y1="1.25" x2="-0.75" y2="1.75" layer="21"/>
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="-1.25" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="SCHOTTKY-1">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="1.016" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.016" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.286" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.286" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="D">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="2.54" y="0.4826" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.3114" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="NSR1020MW2T" prefix="D">
<description>&lt;h4&gt;Diodo Schottky&lt;/h4&gt;
&lt;p&gt;
&lt;a href="http://www.onsemi.com/pub_link/Collateral/NSR1020MW2T1-D.PDF"&gt;Datasheet&lt;/a&gt;&lt;br&gt;
&lt;/p&gt;
&lt;p&gt;
Forward Current: 1A&lt;br&gt;
Forward Voltage: 440mV&lt;br&gt;
Package: SOD-323&lt;br&gt;</description>
<gates>
<gate name="G$1" symbol="SCHOTTKY-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOD323">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="NSR1020MW2T1G" constant="no"/>
<attribute name="OC_FARNELL" value="1431027" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MRA4003T3G" prefix="D">
<description>&lt;h4&gt;
MRA4003T3G
&lt;/h4&gt;
Standard Recovery Power Rectifier
&lt;br&gt;
&lt;a href="http://www.farnell.com/datasheets/1639171.pdf"&gt; datasheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SMA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="MRA4003T3G" constant="no"/>
<attribute name="OC_FARNELL" value="1459134" constant="no"/>
<attribute name="OC_RS" value="545-2434" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="tf_drivers">
<packages>
<package name="SO08">
<description>&lt;b&gt;SMALL OUTLINE INTEGRATED CIRCUIT&lt;/b&gt;&lt;p&gt;
body 3.9 mm/JEDEC MS-012AA</description>
<wire x1="-2.9" y1="3.9" x2="2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="3.9" x2="2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="-3.9" x2="-2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="-2.9" y1="-3.9" x2="-2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1501" y1="-3.1001" x2="-1.6599" y2="-2" layer="51"/>
<rectangle x1="-0.8801" y1="-3.1001" x2="-0.3899" y2="-2" layer="51"/>
<rectangle x1="0.3899" y1="-3.1001" x2="0.8801" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="-3.1001" x2="2.1501" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="2" x2="2.1501" y2="3.1001" layer="51"/>
<rectangle x1="0.3899" y1="2" x2="0.8801" y2="3.1001" layer="51"/>
<rectangle x1="-0.8801" y1="2" x2="-0.3899" y2="3.1001" layer="51"/>
<rectangle x1="-2.1501" y1="2" x2="-1.6599" y2="3.1001" layer="51"/>
<circle x="-1.5" y="-0.8" radius="0.25" width="0" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="BD2051AFJ">
<pin name="GND" x="-10.16" y="5.08" visible="pin" length="short"/>
<pin name="IN" x="-10.16" y="2.54" visible="pin" length="short" swaplevel="1"/>
<pin name="IN@1" x="-10.16" y="0" visible="pin" length="short" swaplevel="1"/>
<pin name="EN" x="-10.16" y="-2.54" visible="pin" length="short"/>
<pin name="!OC" x="12.7" y="-2.54" visible="pin" length="short" rot="R180"/>
<pin name="OUT@1" x="12.7" y="0" visible="pin" length="short" swaplevel="2" rot="R180"/>
<pin name="OUT@2" x="12.7" y="2.54" visible="pin" length="short" swaplevel="2" rot="R180"/>
<pin name="OUT@3" x="12.7" y="5.08" visible="pin" length="short" swaplevel="2" rot="R180"/>
<wire x1="-7.62" y1="8.128" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="8.128" width="0.254" layer="94"/>
<wire x1="10.16" y1="8.128" x2="2.54" y2="8.128" width="0.254" layer="94"/>
<wire x1="0" y1="8.128" x2="-7.62" y2="8.128" width="0.254" layer="94"/>
<wire x1="2.54" y1="8.128" x2="0" y2="8.128" width="0.254" layer="94" curve="-180"/>
<text x="-5.08" y="9.144" size="1.27" layer="95">&gt;NAME</text>
<text x="-5.08" y="-7.112" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="BD2051AFJ">
<description>&lt;h4 &gt;&lt;font color="red"&gt;1ch Hide Side Switch IC&lt;/font&gt;&lt;/h4&gt;
&lt;hr&gt;
&lt;p&gt;
Single channel high side switch IC is a high side switch having over current protection used in power supply line.&lt;br/&gt;
&lt;a href="http://www.farnell.com/datasheets/1636635.pdf"&gt;Datahseet&lt;/a&gt;
&lt;/p&gt;
&lt;p&gt;
&lt;b&gt;Features&lt;/b&gt;&lt;br/&gt;
&lt;ul&gt;
&lt;li&gt;Power supply voltage range: 2.7V~5.5V&lt;/li&gt;
&lt;li&gt;Continuous current load: 500mA&lt;/li&gt;
&lt;li&gt;Control input logic Active-High&lt;/li&gt;
&lt;li&gt;Over current detection&lt;/li&gt;
&lt;li&gt;Thermal shutdown&lt;/li&gt;
&lt;li&gt;Under voltage lockout&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="BD2051AFJ" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO08">
<connects>
<connect gate="G$1" pin="!OC" pad="5"/>
<connect gate="G$1" pin="EN" pad="4"/>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="IN" pad="2"/>
<connect gate="G$1" pin="IN@1" pad="3"/>
<connect gate="G$1" pin="OUT@1" pad="6"/>
<connect gate="G$1" pin="OUT@2" pad="7"/>
<connect gate="G$1" pin="OUT@3" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="BD2051AFJ" constant="no"/>
<attribute name="OC_FARNELL" value="2142991" constant="no"/>
<attribute name="OC_RS" value="-" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="ALIMENTACION" library="frames" deviceset="A4L-LOC" device="" value="Alimentación"/>
<part name="MICROCONTROLADOR" library="frames" deviceset="A3L-LOC" device="" value="Microcontrolador"/>
<part name="U3" library="tf_atmel" deviceset="ATUC3C0512C" device=""/>
<part name="U4" library="tf_comunicaciones" deviceset="MCP2551" device=""/>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device="" value="Perifericos"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="Y1" library="tf_xtal" deviceset="CRYSTAL_49SMX" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="L2" library="tf_ferritas" deviceset="BLM18H" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="D2" library="tf_led" deviceset="HSMF-C155" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device="" value="conectores"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="F1" library="tf_fusibles" deviceset="SMDC050F-*" device="1206" technology="0.5A-">
<attribute name="MPN" value="NANOSMDC050F/13.2"/>
<attribute name="OC_FARNELL" value="134-5942"/>
<attribute name="OC_RS" value="138-679"/>
</part>
<part name="C3" library="tf_condensador_polarizado" deviceset="C293D" device="B" technology="10U-10V-10%-" value="10uF"/>
<part name="C4" library="tf_condensador_polarizado" deviceset="C293D" device="B" technology="100U-6V3-10%-" value="100uF"/>
<part name="U5" library="tf_memorias" deviceset="MT48LC16M16A2" device=""/>
<part name="R4" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
</part>
<part name="R5" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R6" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R7" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R8" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R9" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R10" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R11" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R12" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R13" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R14" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R15" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R16" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R17" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R18" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="R19" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="OC_FARNELL" value="1739078"/>
<attribute name="OC_RS" value="678-9535"/>
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
<attribute name="VALUE" value="68R"/>
</part>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="R20" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="4K7-0.125W-1%-" value="4K7">
<attribute name="POWER" value="125mW"/>
<attribute name="TOLERANCE" value="1%"/>
</part>
<part name="R21" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="4K7-0.125W-1%-" value="4K7">
<attribute name="POWER" value="125mW"/>
<attribute name="TOLERANCE" value="1%"/>
</part>
<part name="R22" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R">
<attribute name="POWER" value="63mW"/>
<attribute name="TOLERANCE" value="5%"/>
</part>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R1" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="120R-0.125W-1%-" value="120R">
<attribute name="POWER" value="125mW"/>
<attribute name="TOLERANCE" value="1%"/>
</part>
<part name="C15" library="tf_condensador" deviceset="C_TF-" device="0402" technology="33N-25V-" value="33nF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C16" library="tf_condensador" deviceset="C_TF-" device="0402" technology="33N-25V-" value="33nF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C17" library="tf_condensador" deviceset="C_TF-" device="0805" technology="4U7-16V-" value="4.7uF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="16V"/>
</part>
<part name="C18" library="tf_condensador" deviceset="C_TF-" device="0805" technology="4U7-16V-" value="4.7uF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="16V"/>
</part>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="U6" library="tf_comunicaciones" deviceset="MAX232ID" device=""/>
<part name="C19" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C20" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF">
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C21" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF">
<attribute name="OC_FARNELL" value="1867948"/>
<attribute name="OC_RS" value="723-5174"/>
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VALUE" value="100nF"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C22" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF">
<attribute name="OC_FARNELL" value="1867948"/>
<attribute name="OC_RS" value="723-5174"/>
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VALUE" value="100nF"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="C23" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF">
<attribute name="OC_FARNELL" value="1867948"/>
<attribute name="OC_RS" value="723-5174"/>
<attribute name="TOLERANCE" value="10%"/>
<attribute name="VALUE" value="100nF"/>
<attribute name="VOLTAGE" value="25V"/>
</part>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="J1" library="tf_conectores_thd" deviceset="SQT-104-01-L-S" device=""/>
<part name="J2" library="tf_conectores_thd" deviceset="S4B-ZR" device=""/>
<part name="L1" library="tf_ferritas" deviceset="BLM41PG600SN1L" device=""/>
<part name="U1" library="tf_conversores_DC_DC" deviceset="LM2937IMP-*" device="" technology="5.0"/>
<part name="H1" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="H2" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="H3" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="H4" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="C1" library="tf_condensador" deviceset="C_TF-" device="0805" technology="4U7-16V-" value="4.7uF"/>
<part name="C2" library="tf_condensador" deviceset="C_TF-" device="0805" technology="4U7-16V-" value="4.7uF"/>
<part name="R3" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R"/>
<part name="R2" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R"/>
<part name="C7" library="tf_condensador" deviceset="C_TF-" device="0402" technology="22P-50V-" value="22pF"/>
<part name="C6" library="tf_condensador" deviceset="C_TF-" device="0402" technology="22P-50V-" value="22pF"/>
<part name="C8" library="tf_condensador" deviceset="C_TF-" device="0402" technology="470P-50V-" value="470pF"/>
<part name="C9" library="tf_condensador" deviceset="C_TF-" device="0603" technology="2U2-16V-" value="2.2uF"/>
<part name="H5" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="H6" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="H7" library="tf_holes" deviceset="MOUNT-HOLE" device="1.5"/>
<part name="J4" library="tf_conectores_thd" deviceset="S4B-ZR" device=""/>
<part name="R23" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R"/>
<part name="R24" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="68R-0.063W-5%-" value="68R"/>
<part name="D1" library="tf_diode" deviceset="NSR1020MW2T" device=""/>
<part name="U2" library="tf_conversores_DC_DC" deviceset="REG1117" device="" technology="3.3"/>
<part name="D3" library="tf_diode" deviceset="MRA4003T3G" device=""/>
<part name="U$1" library="tf_drivers" deviceset="BD2051AFJ" device=""/>
<part name="C24" library="tf_condensador" deviceset="C_TF-" device="0402" technology="1U-6.3V-" value="1uF"/>
<part name="R25" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="10K-0.125W-1%-" value="10K"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="0R-0.0625W-0.05%-" value="0R"/>
<part name="R26" library="tf_resistencia_smd" deviceset="R_TF-" device="0402" technology="0R-0.0625W-0.05%-" value="0R"/>
<part name="J3" library="tf_conectores_thd" deviceset="S3B-ZR" device=""/>
<part name="JTAG" library="tf_conectores_thd" deviceset="B8B-ZR" device=""/>
<part name="C10" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
<part name="C12" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
<part name="C11" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
<part name="C5" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
<part name="C14" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
<part name="C13" library="tf_condensador" deviceset="C_TF-" device="0402" technology="100N-25V-" value="100nF"/>
</parts>
<sheets>
<sheet>
<description>Alimentación</description>
<plain>
<text x="217.424" y="20.574" size="2.286" layer="94" font="vector">Alimentación</text>
<text x="180.34" y="144.78" size="1.778" layer="97">Selección de alimentación</text>
<text x="180.34" y="139.7" size="1.778" layer="97">Soldar R27 para 5V</text>
<text x="180.34" y="137.16" size="1.778" layer="96">Soldar R26 para 3.3V</text>
<wire x1="175.26" y1="149.86" x2="175.26" y2="109.22" width="0.1524" layer="97" style="shortdash"/>
<wire x1="175.26" y1="109.22" x2="243.84" y2="109.22" width="0.1524" layer="97" style="shortdash"/>
<wire x1="243.84" y1="109.22" x2="243.84" y2="149.86" width="0.1524" layer="97" style="shortdash"/>
<wire x1="243.84" y1="149.86" x2="175.26" y2="149.86" width="0.1524" layer="97" style="shortdash"/>
</plain>
<instances>
<instance part="GND1" gate="1" x="132.08" y="119.38"/>
<instance part="GND2" gate="1" x="71.12" y="71.12"/>
<instance part="ALIMENTACION" gate="G$1" x="0" y="0"/>
<instance part="L2" gate="G$1" x="114.3" y="91.44"/>
<instance part="F1" gate="G$1" x="30.48" y="147.32" smashed="yes">
<attribute name="MPN" x="20.32" y="142.24" size="1.778" layer="96" display="off"/>
<attribute name="NAME" x="26.67" y="148.717" size="1.778" layer="95"/>
<attribute name="VALUE" x="17.78" y="143.637" size="1.778" layer="96"/>
<attribute name="OC_FARNELL" x="20.32" y="139.7" size="1.778" layer="96" display="off"/>
<attribute name="OC_RS" x="30.48" y="147.32" size="1.778" layer="96" display="off"/>
</instance>
<instance part="C3" gate="G$1" x="48.26" y="88.9" smashed="yes" rot="R270">
<attribute name="NAME" x="50.8" y="87.122" size="1.016" layer="95"/>
<attribute name="VALUE" x="40.64" y="89.916" size="1.016" layer="96"/>
<attribute name="VOLTAGE" x="40.64" y="88.392" size="1.016" layer="96"/>
<attribute name="TOLERANCE" x="40.64" y="86.868" size="1.016" layer="96"/>
</instance>
<instance part="C4" gate="G$1" x="91.44" y="86.36" smashed="yes" rot="R270">
<attribute name="NAME" x="93.98" y="84.582" size="1.016" layer="95"/>
<attribute name="VALUE" x="83.82" y="87.376" size="1.016" layer="96"/>
<attribute name="VOLTAGE" x="83.82" y="85.852" size="1.016" layer="96"/>
<attribute name="TOLERANCE" x="83.82" y="84.328" size="1.016" layer="96"/>
</instance>
<instance part="L1" gate="G$1" x="83.82" y="147.32"/>
<instance part="U1" gate="G$1" x="116.84" y="144.78"/>
<instance part="C1" gate="G$1" x="71.12" y="134.62" rot="R90"/>
<instance part="C2" gate="G$1" x="96.52" y="134.62" rot="R90"/>
<instance part="D1" gate="G$1" x="50.8" y="147.32"/>
<instance part="U2" gate="G$1" x="71.12" y="99.06" smashed="yes">
<attribute name="NAME" x="63.5" y="104.775" size="1.778" layer="95" ratio="10"/>
<attribute name="VALUE" x="82.804" y="106.68" size="1.778" layer="96" ratio="10" rot="R180"/>
</instance>
<instance part="U$1" gate="G$1" x="96.52" y="30.48"/>
<instance part="C24" gate="G$1" x="78.74" y="38.1" rot="R90"/>
<instance part="R25" gate="G$1" x="116.84" y="43.18" rot="R90"/>
<instance part="GND16" gate="1" x="86.36" y="45.72" rot="R180"/>
<instance part="R27" gate="G$1" x="198.12" y="124.46"/>
<instance part="R26" gate="G$1" x="198.12" y="116.84"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="88.9" y1="147.32" x2="96.52" y2="147.32" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="2"/>
<pinref part="U1" gate="G$1" pin="IN"/>
<pinref part="C2" gate="G$1" pin="P$2"/>
<wire x1="96.52" y1="147.32" x2="104.14" y2="147.32" width="0.1524" layer="91"/>
<wire x1="96.52" y1="137.16" x2="96.52" y2="147.32" width="0.1524" layer="91"/>
<junction x="96.52" y="147.32"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="71.12" y1="127" x2="96.52" y2="127" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="96.52" y1="127" x2="132.08" y2="127" width="0.1524" layer="91"/>
<wire x1="132.08" y1="121.92" x2="132.08" y2="127" width="0.1524" layer="91"/>
<wire x1="132.08" y1="127" x2="132.08" y2="142.24" width="0.1524" layer="91"/>
<junction x="132.08" y="127"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="129.54" y1="142.24" x2="132.08" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="P$1"/>
<wire x1="71.12" y1="127" x2="71.12" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="127" x2="96.52" y2="132.08" width="0.1524" layer="91"/>
<junction x="96.52" y="127"/>
</segment>
<segment>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="71.12" y1="73.66" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
<wire x1="91.44" y1="83.82" x2="91.44" y2="81.28" width="0.1524" layer="91"/>
<wire x1="91.44" y1="81.28" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
<junction x="71.12" y="81.28"/>
<wire x1="48.26" y1="86.36" x2="48.26" y2="81.28" width="0.1524" layer="91"/>
<wire x1="48.26" y1="81.28" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="NEG"/>
<pinref part="C4" gate="G$1" pin="NEG"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="71.12" y1="86.36" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<pinref part="GND16" gate="1" pin="GND"/>
<wire x1="86.36" y1="35.56" x2="86.36" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C24" gate="G$1" pin="P$2"/>
<wire x1="86.36" y1="43.18" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="78.74" y2="40.64" width="0.1524" layer="91"/>
<junction x="86.36" y="43.18"/>
</segment>
</net>
<net name="VDD_5" class="0">
<segment>
<wire x1="40.64" y1="99.06" x2="48.26" y2="99.06" width="0.1524" layer="91"/>
<wire x1="48.26" y1="93.98" x2="48.26" y2="99.06" width="0.1524" layer="91"/>
<label x="35.56" y="101.6" size="1.778" layer="95"/>
<pinref part="C3" gate="G$1" pin="POS"/>
<pinref part="U2" gate="G$1" pin="VIN"/>
<wire x1="58.42" y1="99.06" x2="48.26" y2="99.06" width="0.1524" layer="91"/>
<junction x="48.26" y="99.06"/>
</segment>
<segment>
<wire x1="129.54" y1="147.32" x2="144.78" y2="147.32" width="0.1524" layer="91"/>
<label x="144.78" y="147.32" size="1.778" layer="95"/>
<pinref part="U1" gate="G$1" pin="OUT"/>
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="P$1"/>
<wire x1="193.04" y1="124.46" x2="187.96" y2="124.46" width="0.1524" layer="91"/>
<label x="187.96" y="124.46" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="VDD_33" class="0">
<segment>
<wire x1="101.6" y1="99.06" x2="127" y2="99.06" width="0.1524" layer="91"/>
<label x="127" y="99.06" size="1.778" layer="95"/>
<wire x1="91.44" y1="99.06" x2="91.44" y2="93.98" width="0.1524" layer="91"/>
<wire x1="91.44" y1="93.98" x2="91.44" y2="91.44" width="0.1524" layer="91"/>
<wire x1="101.6" y1="99.06" x2="91.44" y2="99.06" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="101.6" y1="99.06" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
<wire x1="101.6" y1="91.44" x2="106.68" y2="91.44" width="0.1524" layer="91"/>
<junction x="101.6" y="99.06"/>
<pinref part="C4" gate="G$1" pin="POS"/>
<pinref part="U2" gate="G$1" pin="VOUT"/>
<wire x1="83.82" y1="99.06" x2="91.44" y2="99.06" width="0.1524" layer="91"/>
<junction x="91.44" y="99.06"/>
<pinref part="U2" gate="G$1" pin="VO2"/>
<wire x1="83.82" y1="93.98" x2="91.44" y2="93.98" width="0.1524" layer="91"/>
<junction x="91.44" y="93.98"/>
</segment>
<segment>
<pinref part="R26" gate="G$1" pin="P$1"/>
<wire x1="193.04" y1="116.84" x2="187.96" y2="116.84" width="0.1524" layer="91"/>
<label x="187.96" y="116.84" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="76.2" y1="147.32" x2="71.12" y2="147.32" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="1"/>
<pinref part="C1" gate="G$1" pin="P$2"/>
<wire x1="71.12" y1="137.16" x2="71.12" y2="147.32" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="53.34" y1="147.32" x2="71.12" y2="147.32" width="0.1524" layer="91"/>
<junction x="71.12" y="147.32"/>
</segment>
</net>
<net name="VCC_IN" class="0">
<segment>
<wire x1="25.4" y1="147.32" x2="17.78" y2="147.32" width="0.1524" layer="91"/>
<label x="15.24" y="149.86" size="1.778" layer="95"/>
<pinref part="F1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="VDD_ANA" class="0">
<segment>
<pinref part="L2" gate="G$1" pin="2"/>
<wire x1="119.38" y1="91.44" x2="127" y2="91.44" width="0.1524" layer="91"/>
<label x="127" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="F1" gate="G$1" pin="2"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="35.56" y1="147.32" x2="48.26" y2="147.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR_CAMARA_SENSE" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="P$1"/>
<wire x1="116.84" y1="38.1" x2="116.84" y2="27.94" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="!OC"/>
<wire x1="116.84" y1="27.94" x2="109.22" y2="27.94" width="0.1524" layer="91"/>
<wire x1="116.84" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91"/>
<label x="121.92" y="27.94" size="1.778" layer="95"/>
<junction x="116.84" y="27.94"/>
</segment>
</net>
<net name="VDD_CAMARA" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="OUT@1"/>
<wire x1="109.22" y1="30.48" x2="111.76" y2="30.48" width="0.1524" layer="91"/>
<wire x1="111.76" y1="30.48" x2="111.76" y2="33.02" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="OUT@2"/>
<wire x1="109.22" y1="33.02" x2="111.76" y2="33.02" width="0.1524" layer="91"/>
<wire x1="111.76" y1="33.02" x2="111.76" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="OUT@3"/>
<wire x1="111.76" y1="35.56" x2="109.22" y2="35.56" width="0.1524" layer="91"/>
<wire x1="111.76" y1="35.56" x2="134.62" y2="35.56" width="0.1524" layer="91"/>
<label x="134.62" y="35.56" size="1.778" layer="95"/>
<junction x="111.76" y="33.02"/>
<junction x="111.76" y="35.56"/>
</segment>
</net>
<net name="CAMARA_CTRL" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="EN"/>
<wire x1="86.36" y1="27.94" x2="81.28" y2="27.94" width="0.1524" layer="91"/>
<label x="81.28" y="27.94" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="VDD_PERIFERICOS" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="P$2"/>
<wire x1="203.2" y1="116.84" x2="208.28" y2="116.84" width="0.1524" layer="91"/>
<wire x1="208.28" y1="116.84" x2="208.28" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R27" gate="G$1" pin="P$2"/>
<wire x1="203.2" y1="124.46" x2="208.28" y2="124.46" width="0.1524" layer="91"/>
<junction x="208.28" y="124.46"/>
<wire x1="208.28" y1="124.46" x2="215.9" y2="124.46" width="0.1524" layer="91"/>
<label x="215.9" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="P$1"/>
<wire x1="78.74" y1="35.56" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="IN"/>
<wire x1="86.36" y1="33.02" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="IN@1"/>
<wire x1="86.36" y1="30.48" x2="78.74" y2="30.48" width="0.1524" layer="91"/>
<wire x1="78.74" y1="33.02" x2="78.74" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R25" gate="G$1" pin="P$2"/>
<wire x1="116.84" y1="48.26" x2="116.84" y2="53.34" width="0.1524" layer="91"/>
<wire x1="116.84" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
<wire x1="66.04" y1="53.34" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<wire x1="66.04" y1="30.48" x2="78.74" y2="30.48" width="0.1524" layer="91"/>
<wire x1="66.04" y1="53.34" x2="58.42" y2="53.34" width="0.1524" layer="91"/>
<label x="58.42" y="53.34" size="1.778" layer="95" rot="MR0"/>
<junction x="66.04" y="53.34"/>
<junction x="78.74" y="33.02"/>
<junction x="78.74" y="30.48"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Microprocesador</description>
<plain>
<text x="343.916" y="20.32" size="2.286" layer="94" font="vector">Microcontrolador</text>
</plain>
<instances>
<instance part="MICROCONTROLADOR" gate="G$1" x="0" y="0"/>
<instance part="U3" gate="G$1" x="187.96" y="129.54"/>
<instance part="Y1" gate="&gt;NAME" x="276.86" y="167.64" smashed="yes">
<attribute name="NAME" x="275.59" y="173.99" size="1.778" layer="95"/>
<attribute name="VALUE" x="267.97" y="160.02" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="299.72" y="152.4"/>
<instance part="GND5" gate="1" x="271.78" y="81.28"/>
<instance part="D2" gate="G$1" x="347.98" y="231.14"/>
<instance part="GND7" gate="1" x="363.22" y="218.44"/>
<instance part="GND10" gate="1" x="231.14" y="40.64"/>
<instance part="R3" gate="G$1" x="327.66" y="228.6"/>
<instance part="R2" gate="G$1" x="335.28" y="233.68"/>
<instance part="C7" gate="G$1" x="259.08" y="162.56" smashed="yes" rot="R90">
<attribute name="NAME" x="256.54" y="164.846" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="265.43" y="161.544" size="1.27" layer="96" ratio="3" rot="R180"/>
</instance>
<instance part="C6" gate="G$1" x="299.72" y="162.56" smashed="yes" rot="R90">
<attribute name="NAME" x="297.18" y="164.846" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="306.07" y="161.544" size="1.27" layer="96" ratio="3" rot="R180"/>
</instance>
<instance part="C8" gate="G$1" x="274.32" y="132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="271.78" y="134.366" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="280.162" y="135.382" size="1.27" layer="96" ratio="3" rot="R180"/>
</instance>
<instance part="C9" gate="G$1" x="289.56" y="132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="287.02" y="134.366" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="295.402" y="130.302" size="1.27" layer="96" ratio="3" rot="R180"/>
</instance>
<instance part="D3" gate="G$1" x="203.2" y="43.18" smashed="yes">
<attribute name="NAME" x="205.74" y="43.6626" size="1.778" layer="95"/>
<attribute name="VALUE" x="196.596" y="39.3446" size="1.778" layer="96"/>
</instance>
<instance part="C10" gate="G$1" x="274.32" y="88.9" rot="R90"/>
<instance part="C12" gate="G$1" x="231.14" y="60.96" rot="R180"/>
<instance part="C11" gate="G$1" x="223.52" y="43.18" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="CAN_RXD0" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB04"/>
<wire x1="157.48" y1="71.12" x2="157.48" y2="63.5" width="0.1524" layer="91"/>
<label x="157.48" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="CAN_TXD0" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB05"/>
<wire x1="160.02" y1="71.12" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
<label x="160.02" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB30"/>
<wire x1="246.38" y1="167.64" x2="259.08" y2="167.64" width="0.1524" layer="91"/>
<pinref part="Y1" gate="&gt;NAME" pin="1"/>
<pinref part="C7" gate="G$1" pin="P$2"/>
<wire x1="259.08" y1="167.64" x2="269.24" y2="167.64" width="0.1524" layer="91"/>
<wire x1="259.08" y1="165.1" x2="259.08" y2="167.64" width="0.1524" layer="91"/>
<junction x="259.08" y="167.64"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="Y1" gate="&gt;NAME" pin="2"/>
<wire x1="287.02" y1="167.64" x2="299.72" y2="167.64" width="0.1524" layer="91"/>
<wire x1="299.72" y1="167.64" x2="299.72" y2="177.8" width="0.1524" layer="91"/>
<wire x1="299.72" y1="177.8" x2="259.08" y2="177.8" width="0.1524" layer="91"/>
<wire x1="259.08" y1="177.8" x2="259.08" y2="170.18" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PB31"/>
<wire x1="259.08" y1="170.18" x2="246.38" y2="170.18" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="P$2"/>
<wire x1="299.72" y1="165.1" x2="299.72" y2="167.64" width="0.1524" layer="91"/>
<junction x="299.72" y="167.64"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="299.72" y1="154.94" x2="299.72" y2="157.48" width="0.1524" layer="91"/>
<wire x1="259.08" y1="157.48" x2="299.72" y2="157.48" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="P$1"/>
<wire x1="259.08" y1="157.48" x2="259.08" y2="160.02" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="P$1"/>
<wire x1="299.72" y1="157.48" x2="299.72" y2="160.02" width="0.1524" layer="91"/>
<junction x="299.72" y="157.48"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDIO4"/>
<wire x1="127" y1="149.86" x2="119.38" y2="149.86" width="0.1524" layer="91"/>
<label x="119.38" y="149.86" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDIO1"/>
<wire x1="154.94" y1="71.12" x2="154.94" y2="63.5" width="0.1524" layer="91"/>
<label x="154.94" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDIO2"/>
<wire x1="223.52" y1="190.5" x2="223.52" y2="198.12" width="0.1524" layer="91"/>
<label x="223.52" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDIO3"/>
<wire x1="152.4" y1="190.5" x2="152.4" y2="198.12" width="0.1524" layer="91"/>
<label x="152.4" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDPLL"/>
<wire x1="246.38" y1="124.46" x2="256.54" y2="124.46" width="0.1524" layer="91"/>
<label x="256.54" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDCORE"/>
<label x="256.54" y="134.62" size="1.778" layer="95"/>
<wire x1="289.56" y1="137.16" x2="274.32" y2="137.16" width="0.1524" layer="91"/>
<wire x1="274.32" y1="137.16" x2="269.24" y2="137.16" width="0.1524" layer="91"/>
<wire x1="269.24" y1="137.16" x2="269.24" y2="134.62" width="0.1524" layer="91"/>
<wire x1="269.24" y1="134.62" x2="246.38" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="P$2"/>
<wire x1="274.32" y1="134.62" x2="274.32" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="P$2"/>
<wire x1="289.56" y1="134.62" x2="289.56" y2="137.16" width="0.1524" layer="91"/>
<junction x="274.32" y="137.16"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GNDANA"/>
<label x="256.54" y="86.36" size="1.778" layer="95"/>
<wire x1="274.32" y1="83.82" x2="271.78" y2="83.82" width="0.1524" layer="91"/>
<wire x1="271.78" y1="83.82" x2="269.24" y2="83.82" width="0.1524" layer="91"/>
<wire x1="269.24" y1="83.82" x2="269.24" y2="86.36" width="0.1524" layer="91"/>
<wire x1="269.24" y1="86.36" x2="246.38" y2="86.36" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
<junction x="271.78" y="83.82"/>
<wire x1="274.32" y1="83.82" x2="274.32" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="4"/>
<pinref part="GND7" gate="1" pin="GND"/>
<wire x1="350.52" y1="228.6" x2="363.22" y2="228.6" width="0.1524" layer="91"/>
<wire x1="363.22" y1="228.6" x2="363.22" y2="220.98" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="2"/>
<wire x1="350.52" y1="233.68" x2="363.22" y2="233.68" width="0.1524" layer="91"/>
<wire x1="363.22" y1="233.68" x2="363.22" y2="228.6" width="0.1524" layer="91"/>
<junction x="363.22" y="228.6"/>
</segment>
<segment>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="226.06" y1="43.18" x2="231.14" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="VDD_33" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VDDIO1"/>
<wire x1="152.4" y1="71.12" x2="152.4" y2="63.5" width="0.1524" layer="91"/>
<label x="152.4" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDDIN_33"/>
<wire x1="246.38" y1="129.54" x2="256.54" y2="129.54" width="0.1524" layer="91"/>
<label x="256.54" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDDIN_5"/>
<wire x1="246.38" y1="127" x2="256.54" y2="127" width="0.1524" layer="91"/>
<label x="256.54" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDDIO2"/>
<wire x1="226.06" y1="190.5" x2="226.06" y2="198.12" width="0.1524" layer="91"/>
<label x="226.06" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDDIO3"/>
<wire x1="154.94" y1="190.5" x2="154.94" y2="198.12" width="0.1524" layer="91"/>
<label x="154.94" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDDIO4"/>
<wire x1="127" y1="152.4" x2="119.38" y2="152.4" width="0.1524" layer="91"/>
<label x="119.38" y="152.4" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="200.66" y1="43.18" x2="195.58" y2="43.18" width="0.1524" layer="91"/>
<label x="195.58" y="43.18" size="1.778" layer="95" rot="MR0"/>
<pinref part="D3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="VDD_ANA" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VDDANA"/>
<label x="256.54" y="88.9" size="1.778" layer="95"/>
<wire x1="246.38" y1="88.9" x2="269.24" y2="88.9" width="0.1524" layer="91"/>
<wire x1="269.24" y1="88.9" x2="269.24" y2="91.44" width="0.1524" layer="91"/>
<wire x1="269.24" y1="91.44" x2="274.32" y2="91.44" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VDDCORE"/>
<wire x1="246.38" y1="132.08" x2="269.24" y2="132.08" width="0.1524" layer="91"/>
<wire x1="269.24" y1="132.08" x2="269.24" y2="129.54" width="0.1524" layer="91"/>
<wire x1="289.56" y1="129.54" x2="274.32" y2="129.54" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="P$1"/>
<wire x1="274.32" y1="129.54" x2="269.24" y2="129.54" width="0.1524" layer="91"/>
<junction x="274.32" y="129.54"/>
<pinref part="C9" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="1"/>
<wire x1="340.36" y1="233.68" x2="342.9" y2="233.68" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="3"/>
<pinref part="R3" gate="G$1" pin="P$2"/>
<wire x1="332.74" y1="228.6" x2="342.9" y2="228.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_G" class="0">
<segment>
<label x="320.04" y="233.68" size="1.778" layer="95" rot="MR0"/>
<pinref part="R2" gate="G$1" pin="P$1"/>
<wire x1="320.04" y1="233.68" x2="330.2" y2="233.68" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PB01"/>
<wire x1="127" y1="93.98" x2="119.38" y2="93.98" width="0.1524" layer="91"/>
<label x="119.38" y="93.98" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="LED_R" class="0">
<segment>
<label x="320.04" y="228.6" size="1.778" layer="95" rot="MR0"/>
<pinref part="R3" gate="G$1" pin="P$1"/>
<wire x1="320.04" y1="228.6" x2="322.58" y2="228.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PB00"/>
<wire x1="127" y1="96.52" x2="119.38" y2="96.52" width="0.1524" layer="91"/>
<label x="119.38" y="96.52" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="JTAG_TCK" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA00"/>
<wire x1="142.24" y1="71.12" x2="142.24" y2="63.5" width="0.1524" layer="91" style="longdash"/>
<label x="142.24" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="JTAG_TDI" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA01"/>
<wire x1="144.78" y1="71.12" x2="144.78" y2="63.5" width="0.1524" layer="91" style="longdash"/>
<label x="144.78" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="JTAG_TDO" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA02"/>
<wire x1="147.32" y1="71.12" x2="147.32" y2="63.5" width="0.1524" layer="91" style="longdash"/>
<label x="147.32" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="JTAG_TMS" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA03"/>
<wire x1="149.86" y1="71.12" x2="149.86" y2="63.5" width="0.1524" layer="91" style="longdash"/>
<label x="149.86" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="RESETN" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="RESET_N"/>
<wire x1="127" y1="91.44" x2="119.38" y2="91.44" width="0.1524" layer="91" style="longdash"/>
<label x="119.38" y="91.44" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PC16" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC16"/>
<wire x1="190.5" y1="190.5" x2="190.5" y2="198.12" width="0.1524" layer="91"/>
<label x="190.5" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC14" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC14"/>
<wire x1="195.58" y1="190.5" x2="195.58" y2="198.12" width="0.1524" layer="91"/>
<label x="195.58" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="205.74" y1="43.18" x2="215.9" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PA11"/>
<wire x1="210.82" y1="71.12" x2="210.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="210.82" y1="50.8" x2="215.9" y2="50.8" width="0.1524" layer="91"/>
<wire x1="215.9" y1="50.8" x2="215.9" y2="43.18" width="0.1524" layer="91"/>
<junction x="215.9" y="43.18"/>
<pinref part="U3" gate="G$1" pin="PA16"/>
<wire x1="223.52" y1="71.12" x2="223.52" y2="50.8" width="0.1524" layer="91"/>
<wire x1="223.52" y1="50.8" x2="215.9" y2="50.8" width="0.1524" layer="91"/>
<junction x="215.9" y="50.8"/>
<wire x1="215.9" y1="43.18" x2="220.98" y2="43.18" width="0.1524" layer="91"/>
<pinref part="D3" gate="G$1" pin="C"/>
<pinref part="C11" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="ADCVREFP"/>
<wire x1="226.06" y1="60.96" x2="226.06" y2="71.12" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="P$2"/>
<wire x1="226.06" y1="60.96" x2="228.6" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="233.68" y1="60.96" x2="233.68" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="ADCVREFN"/>
<wire x1="233.68" y1="68.58" x2="228.6" y2="68.58" width="0.1524" layer="91"/>
<wire x1="228.6" y1="68.58" x2="228.6" y2="71.12" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="PC31" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC31"/>
<wire x1="147.32" y1="190.5" x2="147.32" y2="198.12" width="0.1524" layer="91"/>
<label x="147.32" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC19" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC19"/>
<wire x1="182.88" y1="190.5" x2="182.88" y2="198.12" width="0.1524" layer="91"/>
<label x="182.88" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC20" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC20"/>
<wire x1="180.34" y1="190.5" x2="180.34" y2="198.12" width="0.1524" layer="91"/>
<label x="180.34" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC21" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC21"/>
<wire x1="177.8" y1="190.5" x2="177.8" y2="198.12" width="0.1524" layer="91"/>
<label x="177.8" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC22" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC22"/>
<wire x1="175.26" y1="190.5" x2="175.26" y2="198.12" width="0.1524" layer="91"/>
<label x="175.26" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC23" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC23"/>
<wire x1="172.72" y1="190.5" x2="172.72" y2="198.12" width="0.1524" layer="91"/>
<label x="172.72" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC24" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC24"/>
<wire x1="170.18" y1="190.5" x2="170.18" y2="198.12" width="0.1524" layer="91"/>
<label x="170.18" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC25" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC25"/>
<wire x1="167.64" y1="190.5" x2="167.64" y2="198.12" width="0.1524" layer="91"/>
<label x="167.64" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC26" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC26"/>
<wire x1="165.1" y1="190.5" x2="165.1" y2="198.12" width="0.1524" layer="91"/>
<label x="165.1" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC27" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC27"/>
<wire x1="162.56" y1="190.5" x2="162.56" y2="198.12" width="0.1524" layer="91"/>
<label x="162.56" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC28" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC28"/>
<wire x1="160.02" y1="190.5" x2="160.02" y2="198.12" width="0.1524" layer="91"/>
<label x="160.02" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC29" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC29"/>
<wire x1="157.48" y1="190.5" x2="157.48" y2="198.12" width="0.1524" layer="91"/>
<label x="157.48" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC30" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC30"/>
<wire x1="149.86" y1="190.5" x2="149.86" y2="198.12" width="0.1524" layer="91"/>
<label x="149.86" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC18" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC18"/>
<wire x1="185.42" y1="190.5" x2="185.42" y2="198.12" width="0.1524" layer="91"/>
<label x="185.42" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC17" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC17"/>
<wire x1="187.96" y1="190.5" x2="187.96" y2="198.12" width="0.1524" layer="91"/>
<label x="187.96" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PC15" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC15"/>
<wire x1="193.04" y1="190.5" x2="193.04" y2="198.12" width="0.1524" layer="91"/>
<label x="193.04" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PD0" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD00"/>
<wire x1="144.78" y1="190.5" x2="144.78" y2="198.12" width="0.1524" layer="91"/>
<label x="144.78" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PD1" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD01"/>
<wire x1="142.24" y1="190.5" x2="142.24" y2="198.12" width="0.1524" layer="91"/>
<label x="142.24" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="PD2" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD02"/>
<wire x1="127" y1="175.26" x2="119.38" y2="175.26" width="0.1524" layer="91"/>
<label x="119.38" y="175.26" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD3" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD03"/>
<wire x1="127" y1="172.72" x2="119.38" y2="172.72" width="0.1524" layer="91"/>
<label x="119.38" y="172.72" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD15" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD15"/>
<wire x1="127" y1="137.16" x2="119.38" y2="137.16" width="0.1524" layer="91"/>
<label x="119.38" y="137.16" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD17" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD17"/>
<wire x1="127" y1="132.08" x2="119.38" y2="132.08" width="0.1524" layer="91"/>
<label x="119.38" y="132.08" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD18" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD18"/>
<wire x1="127" y1="129.54" x2="119.38" y2="129.54" width="0.1524" layer="91"/>
<label x="119.38" y="129.54" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD21" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD21"/>
<wire x1="127" y1="121.92" x2="119.38" y2="121.92" width="0.1524" layer="91"/>
<label x="119.38" y="121.92" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD24" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD24"/>
<wire x1="127" y1="114.3" x2="119.38" y2="114.3" width="0.1524" layer="91"/>
<label x="119.38" y="114.3" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD27" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD27"/>
<wire x1="127" y1="106.68" x2="119.38" y2="106.68" width="0.1524" layer="91"/>
<label x="119.38" y="106.68" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD11" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD11"/>
<wire x1="127" y1="147.32" x2="119.38" y2="147.32" width="0.1524" layer="91"/>
<label x="119.38" y="147.32" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD10" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD10"/>
<wire x1="127" y1="154.94" x2="119.38" y2="154.94" width="0.1524" layer="91"/>
<label x="119.38" y="154.94" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD12" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD12"/>
<wire x1="127" y1="144.78" x2="119.38" y2="144.78" width="0.1524" layer="91"/>
<label x="119.38" y="144.78" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD13" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD13"/>
<wire x1="127" y1="142.24" x2="119.38" y2="142.24" width="0.1524" layer="91"/>
<label x="119.38" y="142.24" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD14" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD14"/>
<wire x1="127" y1="139.7" x2="119.38" y2="139.7" width="0.1524" layer="91"/>
<label x="119.38" y="139.7" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD20" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD20"/>
<wire x1="127" y1="124.46" x2="119.38" y2="124.46" width="0.1524" layer="91"/>
<label x="119.38" y="124.46" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD5" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD05"/>
<wire x1="127" y1="167.64" x2="119.38" y2="167.64" width="0.1524" layer="91"/>
<label x="119.38" y="167.64" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD6" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD06"/>
<wire x1="127" y1="165.1" x2="119.38" y2="165.1" width="0.1524" layer="91"/>
<label x="119.38" y="165.1" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD7" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD07"/>
<wire x1="127" y1="162.56" x2="119.38" y2="162.56" width="0.1524" layer="91"/>
<label x="119.38" y="162.56" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD8" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD08"/>
<wire x1="127" y1="160.02" x2="119.38" y2="160.02" width="0.1524" layer="91"/>
<label x="119.38" y="160.02" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PD9" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD09"/>
<wire x1="127" y1="157.48" x2="119.38" y2="157.48" width="0.1524" layer="91"/>
<label x="119.38" y="157.48" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="UART1-RX" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB16"/>
<wire x1="187.96" y1="71.12" x2="187.96" y2="63.5" width="0.1524" layer="91"/>
<label x="187.96" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="UART1-TX" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB17"/>
<wire x1="190.5" y1="71.12" x2="190.5" y2="63.5" width="0.1524" layer="91"/>
<label x="190.5" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="UART2-TX" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC04"/>
<wire x1="220.98" y1="190.5" x2="220.98" y2="198.12" width="0.1524" layer="91"/>
<label x="220.98" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="UART2-RX" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PC05"/>
<wire x1="218.44" y1="190.5" x2="218.44" y2="198.12" width="0.1524" layer="91"/>
<label x="218.44" y="198.12" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="LED_FLASH1" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB09"/>
<wire x1="170.18" y1="71.12" x2="170.18" y2="63.5" width="0.1524" layer="91"/>
<label x="170.18" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="LED_FLASH2" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PB11"/>
<wire x1="175.26" y1="71.12" x2="175.26" y2="63.5" width="0.1524" layer="91"/>
<label x="175.26" y="63.5" size="1.778" layer="95" rot="MR270"/>
</segment>
</net>
<net name="CAMARA_CTRL" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA26"/>
<wire x1="246.38" y1="106.68" x2="248.92" y2="106.68" width="0.1524" layer="91"/>
<label x="248.92" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWR_CAMARA_SENSE" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PA25"/>
<wire x1="246.38" y1="104.14" x2="248.92" y2="104.14" width="0.1524" layer="91"/>
<label x="248.92" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Perifericos</description>
<plain>
<text x="149.86" y="165.1" size="2.286" layer="97">CAN</text>
<text x="149.86" y="106.68" size="2.286" layer="97">RS232</text>
<wire x1="144.78" y1="111.76" x2="251.46" y2="111.76" width="0.1524" layer="94" style="longdash"/>
<wire x1="251.46" y1="111.76" x2="251.46" y2="27.94" width="0.1524" layer="94" style="longdash"/>
<wire x1="251.46" y1="27.94" x2="144.78" y2="27.94" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="27.94" x2="144.78" y2="111.76" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="114.3" x2="251.46" y2="114.3" width="0.1524" layer="94" style="longdash"/>
<wire x1="251.46" y1="114.3" x2="251.46" y2="170.18" width="0.1524" layer="94" style="longdash"/>
<wire x1="251.46" y1="170.18" x2="144.78" y2="170.18" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="170.18" x2="144.78" y2="114.3" width="0.1524" layer="94" style="longdash"/>
<text x="216.916" y="20.574" size="2.286" layer="94" font="vector">Periféricos</text>
<wire x1="7.62" y1="170.18" x2="139.7" y2="170.18" width="0.1524" layer="94" style="longdash"/>
<wire x1="139.7" y1="170.18" x2="139.7" y2="27.94" width="0.1524" layer="94" style="longdash"/>
<wire x1="139.7" y1="27.94" x2="7.62" y2="27.94" width="0.1524" layer="94" style="longdash"/>
<wire x1="7.62" y1="27.94" x2="7.62" y2="170.18" width="0.1524" layer="94" style="longdash"/>
<text x="12.7" y="165.1" size="2.286" layer="97">SDRAM</text>
<text x="197.104" y="125.73" size="2.54" layer="97">(MAX3051)</text>
<text x="199.644" y="29.21" size="2.286" layer="97">(ADM32003ARNZ)</text>
</plain>
<instances>
<instance part="U4" gate="G$1" x="200.66" y="154.94" rot="R270"/>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="GND3" gate="1" x="177.8" y="160.02" rot="R180"/>
<instance part="GND4" gate="1" x="226.06" y="160.02" rot="R180"/>
<instance part="U5" gate="G$1" x="81.28" y="81.28"/>
<instance part="R4" gate="G$1" x="106.68" y="119.38" smashed="yes">
<attribute name="NAME" x="101.6" y="119.38" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="120.65" size="1.27" layer="96" rot="R180"/>
<attribute name="POWER" x="101.6" y="114.3" size="1.27" layer="97" display="off"/>
<attribute name="TOLERANCE" x="101.6" y="112.522" size="1.27" layer="97" display="off"/>
</instance>
<instance part="R5" gate="G$1" x="106.68" y="116.84" smashed="yes">
<attribute name="NAME" x="101.6" y="116.84" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="118.11" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R6" gate="G$1" x="106.68" y="114.3" smashed="yes">
<attribute name="NAME" x="101.6" y="114.3" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="115.57" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R7" gate="G$1" x="106.68" y="111.76" smashed="yes">
<attribute name="NAME" x="101.6" y="111.76" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="113.03" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R8" gate="G$1" x="106.68" y="109.22" smashed="yes">
<attribute name="NAME" x="101.6" y="109.22" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="110.49" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R9" gate="G$1" x="106.68" y="106.68" smashed="yes">
<attribute name="NAME" x="101.6" y="106.68" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="107.95" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R10" gate="G$1" x="106.68" y="104.14" smashed="yes">
<attribute name="NAME" x="100.584" y="104.394" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="105.41" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R11" gate="G$1" x="106.68" y="101.6" smashed="yes">
<attribute name="NAME" x="100.838" y="101.6" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="102.87" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R12" gate="G$1" x="106.68" y="99.06" smashed="yes">
<attribute name="NAME" x="100.584" y="99.06" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="100.33" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R13" gate="G$1" x="106.68" y="96.52" smashed="yes">
<attribute name="NAME" x="100.584" y="96.52" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="97.79" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R14" gate="G$1" x="106.68" y="93.98" smashed="yes">
<attribute name="NAME" x="100.584" y="93.98" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="95.25" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R15" gate="G$1" x="106.68" y="91.44" smashed="yes">
<attribute name="NAME" x="100.584" y="91.44" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="92.71" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R16" gate="G$1" x="106.68" y="88.9" smashed="yes">
<attribute name="NAME" x="100.584" y="88.9" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="90.17" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R17" gate="G$1" x="106.68" y="86.36" smashed="yes">
<attribute name="NAME" x="100.584" y="86.36" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="87.63" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R18" gate="G$1" x="106.68" y="83.82" smashed="yes">
<attribute name="NAME" x="100.584" y="83.82" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="85.09" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R19" gate="G$1" x="106.68" y="81.28" smashed="yes">
<attribute name="NAME" x="100.584" y="81.28" size="1.27" layer="95"/>
<attribute name="VALUE" x="112.776" y="82.55" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="GND8" gate="1" x="104.14" y="35.56"/>
<instance part="R20" gate="G$1" x="58.42" y="43.18" smashed="yes">
<attribute name="NAME" x="50.8" y="43.18" size="1.27" layer="95"/>
<attribute name="VALUE" x="61.722" y="43.942" size="1.27" layer="96"/>
<attribute name="POWER" x="53.34" y="38.1" size="1.27" layer="97" display="off"/>
<attribute name="TOLERANCE" x="53.34" y="36.322" size="1.27" layer="97" display="off"/>
</instance>
<instance part="R21" gate="G$1" x="58.42" y="55.88" smashed="yes">
<attribute name="NAME" x="50.8" y="55.88" size="1.27" layer="95"/>
<attribute name="VALUE" x="61.976" y="56.388" size="1.27" layer="96"/>
<attribute name="POWER" x="53.34" y="50.8" size="1.27" layer="97" display="off"/>
<attribute name="TOLERANCE" x="53.34" y="49.022" size="1.27" layer="97" display="off"/>
</instance>
<instance part="R22" gate="G$1" x="58.42" y="50.8" smashed="yes">
<attribute name="NAME" x="50.8" y="50.8" size="1.27" layer="95"/>
<attribute name="VALUE" x="61.722" y="51.308" size="1.27" layer="96"/>
<attribute name="POWER" x="53.34" y="45.72" size="1.27" layer="97" display="off"/>
<attribute name="TOLERANCE" x="53.34" y="43.942" size="1.27" layer="97" display="off"/>
</instance>
<instance part="GND9" gate="1" x="45.72" y="55.88" rot="R270"/>
<instance part="R1" gate="G$1" x="228.6" y="142.24" smashed="yes" rot="R90">
<attribute name="NAME" x="227.838" y="136.906" size="1.27" layer="95" rot="R90"/>
<attribute name="VALUE" x="231.648" y="139.7" size="1.27" layer="96" rot="R90"/>
<attribute name="POWER" x="233.68" y="139.7" size="1.27" layer="97" rot="R90"/>
<attribute name="TOLERANCE" x="235.458" y="137.16" size="1.27" layer="97" rot="R90" display="off"/>
</instance>
<instance part="C15" gate="G$1" x="68.58" y="144.78" smashed="yes" rot="R90">
<attribute name="NAME" x="66.04" y="143.002" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="73.66" y="150.368" size="1.27" layer="96" ratio="3" rot="R180"/>
<attribute name="TOLERANCE" x="77.978" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
<attribute name="VOLTAGE" x="76.2" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
</instance>
<instance part="C16" gate="G$1" x="121.92" y="144.78" smashed="yes" rot="R90">
<attribute name="NAME" x="119.38" y="143.002" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="127" y="150.368" size="1.27" layer="96" ratio="3" rot="R180"/>
<attribute name="TOLERANCE" x="131.318" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
<attribute name="VOLTAGE" x="129.54" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
</instance>
<instance part="C17" gate="G$1" x="43.18" y="144.78" smashed="yes" rot="R90">
<attribute name="NAME" x="40.64" y="143.002" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="48.26" y="150.368" size="1.27" layer="96" ratio="3" rot="R180"/>
<attribute name="TOLERANCE" x="52.578" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
<attribute name="VOLTAGE" x="50.8" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
</instance>
<instance part="C18" gate="G$1" x="96.52" y="144.78" smashed="yes" rot="R90">
<attribute name="NAME" x="93.98" y="143.002" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="101.6" y="150.368" size="1.27" layer="96" ratio="3" rot="R180"/>
<attribute name="TOLERANCE" x="105.918" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
<attribute name="VOLTAGE" x="104.14" y="142.24" size="1.27" layer="97" rot="R90" display="off"/>
</instance>
<instance part="GND11" gate="1" x="55.88" y="137.16"/>
<instance part="GND12" gate="1" x="109.22" y="137.16"/>
<instance part="U6" gate="A" x="210.82" y="63.5"/>
<instance part="C19" gate="G$1" x="187.96" y="76.2" smashed="yes">
<attribute name="NAME" x="184.15" y="76.962" size="1.27" layer="95" ratio="3"/>
<attribute name="VALUE" x="182.626" y="74.168" size="1.27" layer="96" ratio="3"/>
<attribute name="TOLERANCE" x="185.42" y="66.802" size="1.27" layer="97" display="off"/>
<attribute name="VOLTAGE" x="185.42" y="68.58" size="1.27" layer="97" display="off"/>
</instance>
<instance part="C20" gate="G$1" x="177.8" y="50.8" smashed="yes">
<attribute name="NAME" x="181.356" y="51.308" size="1.27" layer="95" ratio="3"/>
<attribute name="VALUE" x="181.102" y="48.768" size="1.27" layer="96" ratio="3"/>
<attribute name="TOLERANCE" x="175.26" y="41.402" size="1.27" layer="97" display="off"/>
<attribute name="VOLTAGE" x="175.26" y="43.18" size="1.27" layer="97" display="off"/>
</instance>
<instance part="C21" gate="G$1" x="187.96" y="45.72" smashed="yes">
<attribute name="NAME" x="183.896" y="46.736" size="1.27" layer="95" ratio="3"/>
<attribute name="VALUE" x="182.372" y="43.688" size="1.27" layer="96" ratio="3"/>
<attribute name="TOLERANCE" x="185.42" y="36.322" size="1.27" layer="97" display="off"/>
<attribute name="VOLTAGE" x="185.42" y="38.1" size="1.27" layer="97" display="off"/>
</instance>
<instance part="C22" gate="G$1" x="187.96" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="187.198" y="96.012" size="1.27" layer="95" ratio="3" rot="R180"/>
<attribute name="VALUE" x="197.358" y="95.758" size="1.27" layer="96" ratio="3" rot="R180"/>
<attribute name="VOLTAGE" x="197.358" y="93.98" size="1.27" layer="97" rot="R180"/>
<attribute name="TOLERANCE" x="197.612" y="92.202" size="1.27" layer="97" rot="R180"/>
</instance>
<instance part="C23" gate="G$1" x="187.96" y="63.5" smashed="yes">
<attribute name="NAME" x="184.15" y="64.262" size="1.27" layer="95" ratio="3"/>
<attribute name="VALUE" x="182.372" y="61.468" size="1.27" layer="96" ratio="3"/>
<attribute name="TOLERANCE" x="185.42" y="54.102" size="1.27" layer="97" display="off"/>
<attribute name="VOLTAGE" x="185.42" y="55.88" size="1.27" layer="97" display="off"/>
</instance>
<instance part="GND13" gate="1" x="180.34" y="33.02"/>
<instance part="GND14" gate="1" x="187.96" y="101.6" rot="R180"/>
<instance part="C5" gate="G$1" x="177.8" y="147.32" rot="R90"/>
<instance part="C14" gate="G$1" x="109.22" y="144.78" rot="R90"/>
<instance part="C13" gate="G$1" x="55.88" y="144.78" rot="R90"/>
</instances>
<busses>
<bus name="PC[19..31]">
<segment>
<wire x1="124.46" y1="91.44" x2="124.46" y2="124.46" width="0.762" layer="92"/>
<wire x1="124.46" y1="124.46" x2="127" y2="124.46" width="0.762" layer="92"/>
<label x="124.206" y="125.476" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="PC[14..18]">
<segment>
<wire x1="12.7" y1="55.88" x2="15.24" y2="55.88" width="0.762" layer="92"/>
<wire x1="15.24" y1="55.88" x2="15.24" y2="43.18" width="0.762" layer="92"/>
<label x="12.7" y="57.15" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="PD[0..30]">
<segment>
<wire x1="12.7" y1="121.92" x2="15.24" y2="121.92" width="0.762" layer="92"/>
<wire x1="15.24" y1="121.92" x2="15.24" y2="71.12" width="0.762" layer="92"/>
<label x="12.446" y="122.936" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="PD[0..2]">
<segment>
<wire x1="132.08" y1="88.9" x2="129.54" y2="88.9" width="0.762" layer="92"/>
<wire x1="129.54" y1="88.9" x2="129.54" y2="81.28" width="0.762" layer="92"/>
<label x="128.524" y="89.916" size="1.778" layer="95"/>
</segment>
</bus>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="177.8" y1="157.48" x2="177.8" y2="154.94" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="VSS"/>
<wire x1="177.8" y1="154.94" x2="177.8" y2="149.86" width="0.1524" layer="91"/>
<wire x1="182.88" y1="147.32" x2="195.58" y2="147.32" width="0.1524" layer="91"/>
<wire x1="182.88" y1="147.32" x2="182.88" y2="154.94" width="0.1524" layer="91"/>
<wire x1="182.88" y1="154.94" x2="177.8" y2="154.94" width="0.1524" layer="91"/>
<junction x="177.8" y="154.94"/>
<pinref part="C5" gate="G$1" pin="P$2"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="RS"/>
<wire x1="215.9" y1="152.4" x2="226.06" y2="152.4" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="226.06" y1="152.4" x2="226.06" y2="157.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="VSSQ@4"/>
<wire x1="96.52" y1="40.64" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<wire x1="104.14" y1="40.64" x2="104.14" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSSQ@3"/>
<wire x1="96.52" y1="43.18" x2="104.14" y2="43.18" width="0.1524" layer="91"/>
<wire x1="104.14" y1="43.18" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSSQ@2"/>
<wire x1="96.52" y1="45.72" x2="104.14" y2="45.72" width="0.1524" layer="91"/>
<wire x1="104.14" y1="45.72" x2="104.14" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSSQ@1"/>
<wire x1="96.52" y1="48.26" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<wire x1="104.14" y1="48.26" x2="104.14" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSS@3"/>
<wire x1="96.52" y1="50.8" x2="104.14" y2="50.8" width="0.1524" layer="91"/>
<wire x1="104.14" y1="50.8" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSS@2"/>
<wire x1="96.52" y1="53.34" x2="104.14" y2="53.34" width="0.1524" layer="91"/>
<wire x1="104.14" y1="53.34" x2="104.14" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VSS@1"/>
<wire x1="96.52" y1="55.88" x2="104.14" y2="55.88" width="0.1524" layer="91"/>
<wire x1="104.14" y1="55.88" x2="104.14" y2="53.34" width="0.1524" layer="91"/>
<junction x="104.14" y="53.34"/>
<junction x="104.14" y="50.8"/>
<junction x="104.14" y="48.26"/>
<junction x="104.14" y="45.72"/>
<junction x="104.14" y="43.18"/>
<junction x="104.14" y="40.64"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="R21" gate="G$1" pin="P$1"/>
<wire x1="48.26" y1="55.88" x2="53.34" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="142.24" x2="96.52" y2="139.7" width="0.1524" layer="91"/>
<wire x1="96.52" y1="139.7" x2="109.22" y2="139.7" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="P$1"/>
<wire x1="109.22" y1="139.7" x2="121.92" y2="139.7" width="0.1524" layer="91"/>
<wire x1="121.92" y1="139.7" x2="121.92" y2="142.24" width="0.1524" layer="91"/>
<wire x1="109.22" y1="142.24" x2="109.22" y2="139.7" width="0.1524" layer="91"/>
<junction x="109.22" y="139.7"/>
<pinref part="GND12" gate="1" pin="GND"/>
<pinref part="C14" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="P$1"/>
<wire x1="43.18" y1="142.24" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="P$1"/>
<wire x1="43.18" y1="139.7" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
<wire x1="55.88" y1="139.7" x2="68.58" y2="139.7" width="0.1524" layer="91"/>
<wire x1="68.58" y1="139.7" x2="68.58" y2="142.24" width="0.1524" layer="91"/>
<wire x1="55.88" y1="142.24" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
<junction x="55.88" y="139.7"/>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="C13" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="U6" gate="A" pin="GND"/>
<pinref part="GND13" gate="1" pin="GND"/>
<wire x1="193.04" y1="38.1" x2="180.34" y2="38.1" width="0.1524" layer="91"/>
<wire x1="180.34" y1="38.1" x2="180.34" y2="35.56" width="0.1524" layer="91"/>
<wire x1="180.34" y1="38.1" x2="180.34" y2="45.72" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="P$1"/>
<wire x1="180.34" y1="45.72" x2="185.42" y2="45.72" width="0.1524" layer="91"/>
<junction x="180.34" y="38.1"/>
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="P$2"/>
<pinref part="GND14" gate="1" pin="GND"/>
<wire x1="187.96" y1="93.98" x2="187.96" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CAN_TXD0" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="TXD"/>
<wire x1="195.58" y1="152.4" x2="193.04" y2="152.4" width="0.1524" layer="91"/>
<label x="185.42" y="152.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="CAN_RXD0" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="RXD"/>
<wire x1="195.58" y1="137.16" x2="193.04" y2="137.16" width="0.1524" layer="91"/>
<wire x1="193.04" y1="137.16" x2="193.04" y2="121.92" width="0.1524" layer="91"/>
<wire x1="193.04" y1="121.92" x2="190.5" y2="121.92" width="0.1524" layer="91"/>
<label x="179.07" y="122.174" size="1.778" layer="95"/>
</segment>
</net>
<net name="CAN_L" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="CANL"/>
<wire x1="215.9" y1="142.24" x2="220.98" y2="142.24" width="0.1524" layer="91"/>
<wire x1="220.98" y1="142.24" x2="220.98" y2="134.62" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="P$1"/>
<wire x1="228.6" y1="137.16" x2="228.6" y2="134.62" width="0.1524" layer="91"/>
<wire x1="228.6" y1="134.62" x2="220.98" y2="134.62" width="0.1524" layer="91"/>
<wire x1="228.6" y1="134.62" x2="233.68" y2="134.62" width="0.1524" layer="91"/>
<label x="233.68" y="134.62" size="1.778" layer="95"/>
<junction x="228.6" y="134.62"/>
</segment>
</net>
<net name="CAN_H" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="CANH"/>
<label x="233.68" y="147.32" size="1.778" layer="95"/>
<wire x1="215.9" y1="147.32" x2="228.6" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="P$2"/>
<wire x1="228.6" y1="147.32" x2="233.68" y2="147.32" width="0.1524" layer="91"/>
<junction x="228.6" y="147.32"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ0"/>
<pinref part="R4" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="119.38" x2="101.6" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ1"/>
<pinref part="R5" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="116.84" x2="101.6" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ2"/>
<pinref part="R6" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="114.3" x2="101.6" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ3"/>
<pinref part="R7" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="111.76" x2="101.6" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ4"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="109.22" x2="101.6" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ5"/>
<pinref part="R9" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="106.68" x2="101.6" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ6"/>
<pinref part="R10" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="104.14" x2="101.6" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ7"/>
<pinref part="R11" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="101.6" x2="101.6" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ8"/>
<pinref part="R12" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="99.06" x2="101.6" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ9"/>
<pinref part="R13" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="96.52" x2="101.6" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ10"/>
<pinref part="R14" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="93.98" x2="101.6" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ11"/>
<pinref part="R15" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="91.44" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ12"/>
<pinref part="R16" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="88.9" x2="101.6" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ13"/>
<pinref part="R17" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="86.36" x2="101.6" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ14"/>
<pinref part="R18" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQ15"/>
<pinref part="R19" gate="G$1" pin="P$1"/>
<wire x1="96.52" y1="81.28" x2="101.6" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VDD_33" class="0">
<segment>
<pinref part="R20" gate="G$1" pin="P$1"/>
<wire x1="53.34" y1="43.18" x2="45.72" y2="43.18" width="0.1524" layer="91"/>
<label x="44.704" y="38.1" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="VDD@3"/>
<wire x1="96.52" y1="60.96" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<wire x1="104.14" y1="60.96" x2="104.14" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDDQ@1"/>
<wire x1="104.14" y1="63.5" x2="104.14" y2="66.04" width="0.1524" layer="91"/>
<wire x1="104.14" y1="66.04" x2="104.14" y2="68.58" width="0.1524" layer="91"/>
<wire x1="104.14" y1="68.58" x2="104.14" y2="71.12" width="0.1524" layer="91"/>
<wire x1="104.14" y1="71.12" x2="104.14" y2="73.66" width="0.1524" layer="91"/>
<wire x1="104.14" y1="73.66" x2="104.14" y2="76.2" width="0.1524" layer="91"/>
<wire x1="104.14" y1="76.2" x2="96.52" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDDQ@2"/>
<wire x1="96.52" y1="73.66" x2="104.14" y2="73.66" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDDQ@3"/>
<wire x1="96.52" y1="71.12" x2="104.14" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDDQ@4"/>
<wire x1="96.52" y1="68.58" x2="104.14" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDD@1"/>
<wire x1="96.52" y1="66.04" x2="104.14" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VDD@2"/>
<wire x1="96.52" y1="63.5" x2="104.14" y2="63.5" width="0.1524" layer="91"/>
<junction x="104.14" y="73.66"/>
<junction x="104.14" y="71.12"/>
<junction x="104.14" y="68.58"/>
<junction x="104.14" y="66.04"/>
<junction x="104.14" y="63.5"/>
<wire x1="114.3" y1="68.58" x2="104.14" y2="68.58" width="0.1524" layer="91"/>
<label x="114.3" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="P$2"/>
<wire x1="43.18" y1="147.32" x2="43.18" y2="152.4" width="0.1524" layer="91"/>
<wire x1="43.18" y1="152.4" x2="55.88" y2="152.4" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="P$2"/>
<wire x1="55.88" y1="152.4" x2="68.58" y2="152.4" width="0.1524" layer="91"/>
<wire x1="68.58" y1="152.4" x2="68.58" y2="147.32" width="0.1524" layer="91"/>
<wire x1="55.88" y1="147.32" x2="55.88" y2="152.4" width="0.1524" layer="91"/>
<junction x="55.88" y="152.4"/>
<wire x1="55.88" y1="152.4" x2="55.88" y2="157.48" width="0.1524" layer="91"/>
<label x="50.8" y="158.242" size="1.778" layer="95"/>
<pinref part="C13" gate="G$1" pin="P$2"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="P$2"/>
<wire x1="96.52" y1="147.32" x2="96.52" y2="152.4" width="0.1524" layer="91"/>
<wire x1="96.52" y1="152.4" x2="109.22" y2="152.4" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="P$2"/>
<wire x1="109.22" y1="152.4" x2="121.92" y2="152.4" width="0.1524" layer="91"/>
<wire x1="121.92" y1="152.4" x2="121.92" y2="147.32" width="0.1524" layer="91"/>
<wire x1="109.22" y1="147.32" x2="109.22" y2="152.4" width="0.1524" layer="91"/>
<junction x="109.22" y="152.4"/>
<wire x1="109.22" y1="152.4" x2="109.22" y2="157.48" width="0.1524" layer="91"/>
<label x="104.14" y="158.242" size="1.778" layer="95"/>
<pinref part="C14" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="CLK"/>
<pinref part="R22" gate="G$1" pin="P$2"/>
<wire x1="68.58" y1="50.8" x2="66.04" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="P$2"/>
<wire x1="66.04" y1="50.8" x2="63.5" y2="50.8" width="0.1524" layer="91"/>
<wire x1="63.5" y1="43.18" x2="66.04" y2="43.18" width="0.1524" layer="91"/>
<wire x1="66.04" y1="43.18" x2="66.04" y2="50.8" width="0.1524" layer="91"/>
<junction x="66.04" y="50.8"/>
</segment>
</net>
<net name="PC31" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="88.9" x2="121.92" y2="88.9" width="0.1524" layer="91"/>
<wire x1="121.92" y1="88.9" x2="124.46" y2="91.44" width="0.1524" layer="91"/>
<label x="114.3" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC30" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="91.44" x2="121.92" y2="91.44" width="0.1524" layer="91"/>
<wire x1="121.92" y1="91.44" x2="124.46" y2="93.98" width="0.1524" layer="91"/>
<label x="114.3" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC29" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="93.98" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
<wire x1="121.92" y1="93.98" x2="124.46" y2="96.52" width="0.1524" layer="91"/>
<label x="114.3" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC28" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="96.52" x2="121.92" y2="96.52" width="0.1524" layer="91"/>
<wire x1="121.92" y1="96.52" x2="124.46" y2="99.06" width="0.1524" layer="91"/>
<label x="114.3" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC27" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="99.06" x2="121.92" y2="99.06" width="0.1524" layer="91"/>
<wire x1="121.92" y1="99.06" x2="124.46" y2="101.6" width="0.1524" layer="91"/>
<label x="114.3" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC26" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="101.6" x2="121.92" y2="101.6" width="0.1524" layer="91"/>
<wire x1="121.92" y1="101.6" x2="124.46" y2="104.14" width="0.1524" layer="91"/>
<label x="114.3" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC25" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="104.14" x2="121.92" y2="104.14" width="0.1524" layer="91"/>
<wire x1="121.92" y1="104.14" x2="124.46" y2="106.68" width="0.1524" layer="91"/>
<label x="114.3" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC24" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="106.68" x2="121.92" y2="106.68" width="0.1524" layer="91"/>
<wire x1="121.92" y1="106.68" x2="124.46" y2="109.22" width="0.1524" layer="91"/>
<label x="114.3" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC23" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="109.22" x2="121.92" y2="109.22" width="0.1524" layer="91"/>
<wire x1="121.92" y1="109.22" x2="124.46" y2="111.76" width="0.1524" layer="91"/>
<label x="114.3" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC22" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="111.76" x2="121.92" y2="111.76" width="0.1524" layer="91"/>
<wire x1="121.92" y1="111.76" x2="124.46" y2="114.3" width="0.1524" layer="91"/>
<label x="114.3" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC21" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="114.3" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<wire x1="121.92" y1="114.3" x2="124.46" y2="116.84" width="0.1524" layer="91"/>
<label x="114.3" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC20" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="116.84" x2="121.92" y2="116.84" width="0.1524" layer="91"/>
<wire x1="121.92" y1="116.84" x2="124.46" y2="119.38" width="0.1524" layer="91"/>
<label x="114.3" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC19" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="P$2"/>
<wire x1="111.76" y1="119.38" x2="121.92" y2="119.38" width="0.1524" layer="91"/>
<wire x1="121.92" y1="119.38" x2="124.46" y2="121.92" width="0.1524" layer="91"/>
<label x="114.3" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC14" class="0">
<segment>
<wire x1="15.24" y1="45.72" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="CKE"/>
<wire x1="68.58" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
<wire x1="66.04" y1="53.34" x2="66.04" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="P$2"/>
<wire x1="66.04" y1="55.88" x2="63.5" y2="55.88" width="0.1524" layer="91"/>
<wire x1="66.04" y1="53.34" x2="38.1" y2="53.34" width="0.1524" layer="91"/>
<wire x1="38.1" y1="53.34" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<wire x1="38.1" y1="43.18" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<label x="17.78" y="43.18" size="1.778" layer="95"/>
<junction x="66.04" y="53.34"/>
</segment>
</net>
<net name="PC15" class="0">
<segment>
<wire x1="15.24" y1="53.34" x2="17.78" y2="50.8" width="0.1524" layer="91"/>
<wire x1="17.78" y1="50.8" x2="30.48" y2="50.8" width="0.1524" layer="91"/>
<wire x1="30.48" y1="50.8" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="!WE"/>
<wire x1="30.48" y1="68.58" x2="68.58" y2="68.58" width="0.1524" layer="91"/>
<label x="17.78" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC16" class="0">
<segment>
<wire x1="15.24" y1="50.8" x2="17.78" y2="48.26" width="0.1524" layer="91"/>
<wire x1="17.78" y1="48.26" x2="33.02" y2="48.26" width="0.1524" layer="91"/>
<wire x1="33.02" y1="48.26" x2="33.02" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="!CAS"/>
<wire x1="33.02" y1="66.04" x2="68.58" y2="66.04" width="0.1524" layer="91"/>
<label x="17.78" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC17" class="0">
<segment>
<wire x1="15.24" y1="48.26" x2="17.78" y2="45.72" width="0.1524" layer="91"/>
<wire x1="17.78" y1="45.72" x2="35.56" y2="45.72" width="0.1524" layer="91"/>
<wire x1="35.56" y1="45.72" x2="35.56" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="!RAS"/>
<wire x1="35.56" y1="63.5" x2="68.58" y2="63.5" width="0.1524" layer="91"/>
<label x="17.78" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC18" class="0">
<segment>
<wire x1="15.24" y1="55.88" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<wire x1="17.78" y1="53.34" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<wire x1="27.94" y1="53.34" x2="27.94" y2="60.96" width="0.1524" layer="91"/>
<wire x1="27.94" y1="60.96" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
<wire x1="50.8" y1="60.96" x2="50.8" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="A10"/>
<wire x1="50.8" y1="93.98" x2="68.58" y2="93.98" width="0.1524" layer="91"/>
<label x="17.78" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD5" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A0"/>
<wire x1="15.24" y1="121.92" x2="17.78" y2="119.38" width="0.1524" layer="91"/>
<wire x1="17.78" y1="119.38" x2="68.58" y2="119.38" width="0.1524" layer="91"/>
<label x="22.86" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD6" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A1"/>
<wire x1="15.24" y1="119.38" x2="17.78" y2="116.84" width="0.1524" layer="91"/>
<wire x1="17.78" y1="116.84" x2="68.58" y2="116.84" width="0.1524" layer="91"/>
<label x="22.86" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD7" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A2"/>
<wire x1="15.24" y1="116.84" x2="17.78" y2="114.3" width="0.1524" layer="91"/>
<wire x1="17.78" y1="114.3" x2="68.58" y2="114.3" width="0.1524" layer="91"/>
<label x="22.86" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD8" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A3"/>
<wire x1="15.24" y1="114.3" x2="17.78" y2="111.76" width="0.1524" layer="91"/>
<wire x1="17.78" y1="111.76" x2="68.58" y2="111.76" width="0.1524" layer="91"/>
<label x="22.86" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD9" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A4"/>
<wire x1="15.24" y1="111.76" x2="17.78" y2="109.22" width="0.1524" layer="91"/>
<wire x1="17.78" y1="109.22" x2="68.58" y2="109.22" width="0.1524" layer="91"/>
<label x="22.86" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD10" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A5"/>
<wire x1="15.24" y1="109.22" x2="17.78" y2="106.68" width="0.1524" layer="91"/>
<wire x1="17.78" y1="106.68" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<label x="22.86" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD11" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A6"/>
<wire x1="15.24" y1="106.68" x2="17.78" y2="104.14" width="0.1524" layer="91"/>
<wire x1="17.78" y1="104.14" x2="68.58" y2="104.14" width="0.1524" layer="91"/>
<label x="22.86" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD12" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A7"/>
<wire x1="15.24" y1="104.14" x2="17.78" y2="101.6" width="0.1524" layer="91"/>
<wire x1="17.78" y1="101.6" x2="68.58" y2="101.6" width="0.1524" layer="91"/>
<label x="22.86" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD14" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A8"/>
<wire x1="15.24" y1="101.6" x2="17.78" y2="99.06" width="0.1524" layer="91"/>
<wire x1="17.78" y1="99.06" x2="68.58" y2="99.06" width="0.1524" layer="91"/>
<label x="22.86" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD15" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A9"/>
<wire x1="15.24" y1="99.06" x2="17.78" y2="96.52" width="0.1524" layer="91"/>
<wire x1="17.78" y1="96.52" x2="68.58" y2="96.52" width="0.1524" layer="91"/>
<label x="22.86" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD17" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A11"/>
<wire x1="15.24" y1="93.98" x2="17.78" y2="91.44" width="0.1524" layer="91"/>
<wire x1="17.78" y1="91.44" x2="68.58" y2="91.44" width="0.1524" layer="91"/>
<label x="22.86" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD18" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="A12"/>
<wire x1="15.24" y1="91.44" x2="17.78" y2="88.9" width="0.1524" layer="91"/>
<wire x1="17.78" y1="88.9" x2="68.58" y2="88.9" width="0.1524" layer="91"/>
<label x="22.86" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD20" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="BA0"/>
<wire x1="15.24" y1="86.36" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
<wire x1="17.78" y1="83.82" x2="68.58" y2="83.82" width="0.1524" layer="91"/>
<label x="22.86" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD21" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="BA1"/>
<wire x1="15.24" y1="83.82" x2="17.78" y2="81.28" width="0.1524" layer="91"/>
<wire x1="17.78" y1="81.28" x2="68.58" y2="81.28" width="0.1524" layer="91"/>
<label x="22.86" y="81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD3" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQML"/>
<wire x1="15.24" y1="78.74" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="17.78" y1="76.2" x2="68.58" y2="76.2" width="0.1524" layer="91"/>
<label x="22.86" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD24" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DQMH"/>
<wire x1="15.24" y1="76.2" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
<wire x1="17.78" y1="73.66" x2="68.58" y2="73.66" width="0.1524" layer="91"/>
<label x="22.86" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD27" class="0">
<segment>
<wire x1="15.24" y1="73.66" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
<wire x1="17.78" y1="71.12" x2="55.88" y2="71.12" width="0.1524" layer="91"/>
<wire x1="55.88" y1="71.12" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="!CS"/>
<wire x1="55.88" y1="60.96" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
<label x="22.86" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD13" class="0">
<segment>
<wire x1="15.24" y1="71.12" x2="17.78" y2="68.58" width="0.1524" layer="91"/>
<wire x1="17.78" y1="68.58" x2="25.4" y2="68.58" width="0.1524" layer="91"/>
<wire x1="25.4" y1="68.58" x2="25.4" y2="58.42" width="0.1524" layer="91"/>
<wire x1="25.4" y1="58.42" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="P$1"/>
<wire x1="53.34" y1="50.8" x2="40.64" y2="50.8" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="40.64" y2="50.8" width="0.1524" layer="91"/>
<label x="22.86" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD0" class="0">
<segment>
<pinref part="R17" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="88.9" x2="127" y2="86.36" width="0.1524" layer="91"/>
<wire x1="127" y1="86.36" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
<label x="121.92" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD1" class="0">
<segment>
<pinref part="R18" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="86.36" x2="127" y2="83.82" width="0.1524" layer="91"/>
<wire x1="127" y1="83.82" x2="111.76" y2="83.82" width="0.1524" layer="91"/>
<label x="121.92" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="PD2" class="0">
<segment>
<pinref part="R19" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="83.82" x2="127" y2="81.28" width="0.1524" layer="91"/>
<wire x1="127" y1="81.28" x2="111.76" y2="81.28" width="0.1524" layer="91"/>
<label x="121.92" y="81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="VDD_PERIFERICOS" class="0">
<segment>
<wire x1="170.18" y1="83.82" x2="175.26" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U6" gate="A" pin="VCC"/>
<pinref part="C22" gate="G$1" pin="P$1"/>
<wire x1="175.26" y1="83.82" x2="187.96" y2="83.82" width="0.1524" layer="91"/>
<wire x1="187.96" y1="83.82" x2="193.04" y2="83.82" width="0.1524" layer="91"/>
<wire x1="187.96" y1="83.82" x2="187.96" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="P$1"/>
<wire x1="175.26" y1="50.8" x2="175.26" y2="83.82" width="0.1524" layer="91"/>
<junction x="175.26" y="83.82"/>
<junction x="187.96" y="83.82"/>
<label x="170.18" y="83.82" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="VDD"/>
<wire x1="195.58" y1="142.24" x2="177.8" y2="142.24" width="0.1524" layer="91"/>
<wire x1="177.8" y1="144.78" x2="177.8" y2="142.24" width="0.1524" layer="91"/>
<wire x1="177.8" y1="142.24" x2="172.72" y2="142.24" width="0.1524" layer="91"/>
<label x="172.72" y="142.24" size="1.778" layer="95" rot="MR0"/>
<junction x="177.8" y="142.24"/>
<pinref part="C5" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="U6" gate="A" pin="C1-"/>
<wire x1="193.04" y1="71.12" x2="180.34" y2="71.12" width="0.1524" layer="91"/>
<wire x1="180.34" y1="71.12" x2="180.34" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="P$1"/>
<wire x1="180.34" y1="76.2" x2="185.42" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="U6" gate="A" pin="C2+"/>
<wire x1="193.04" y1="58.42" x2="180.34" y2="58.42" width="0.1524" layer="91"/>
<wire x1="180.34" y1="58.42" x2="180.34" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="P$1"/>
<wire x1="180.34" y1="63.5" x2="185.42" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="U6" gate="A" pin="VS-"/>
<pinref part="C21" gate="G$1" pin="P$2"/>
<wire x1="193.04" y1="45.72" x2="190.5" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U6" gate="A" pin="C1+"/>
<pinref part="C19" gate="G$1" pin="P$2"/>
<wire x1="193.04" y1="76.2" x2="190.5" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U6" gate="A" pin="C2-"/>
<pinref part="C23" gate="G$1" pin="P$2"/>
<wire x1="193.04" y1="63.5" x2="190.5" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="U6" gate="A" pin="VS+"/>
<pinref part="C20" gate="G$1" pin="P$2"/>
<wire x1="193.04" y1="50.8" x2="180.34" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="UARTCAM-TXD" class="0">
<segment>
<pinref part="U6" gate="A" pin="R1IN"/>
<wire x1="228.6" y1="48.26" x2="231.14" y2="48.26" width="0.1524" layer="91"/>
<label x="231.14" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="UART1-RX" class="0">
<segment>
<pinref part="U6" gate="A" pin="R1OUT"/>
<wire x1="228.6" y1="68.58" x2="231.14" y2="68.58" width="0.1524" layer="91"/>
<label x="231.14" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="UART2-RX" class="0">
<segment>
<pinref part="U6" gate="A" pin="R2OUT"/>
<wire x1="228.6" y1="66.04" x2="231.14" y2="66.04" width="0.1524" layer="91"/>
<label x="231.14" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="UART1-TX" class="0">
<segment>
<pinref part="U6" gate="A" pin="T1IN"/>
<wire x1="228.6" y1="55.88" x2="231.14" y2="55.88" width="0.1524" layer="91"/>
<label x="231.14" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="UART2-TX" class="0">
<segment>
<pinref part="U6" gate="A" pin="T2IN"/>
<wire x1="228.6" y1="53.34" x2="231.14" y2="53.34" width="0.1524" layer="91"/>
<label x="231.14" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="UARTPC-RXD(2)" class="0">
<segment>
<pinref part="U6" gate="A" pin="T2OUT"/>
<wire x1="228.6" y1="73.66" x2="231.14" y2="73.66" width="0.1524" layer="91"/>
<label x="231.14" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="UARTCAM-RXD" class="0">
<segment>
<pinref part="U6" gate="A" pin="T1OUT"/>
<wire x1="228.6" y1="76.2" x2="231.14" y2="76.2" width="0.1524" layer="91"/>
<label x="231.14" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="UARTPC-TXD(3)" class="0">
<segment>
<pinref part="U6" gate="A" pin="R2IN"/>
<wire x1="228.6" y1="45.72" x2="231.14" y2="45.72" width="0.1524" layer="91"/>
<label x="231.14" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Conectores</description>
<plain>
<text x="27.94" y="160.02" size="2.286" layer="97">JTAG Connector</text>
<wire x1="25.4" y1="165.1" x2="25.4" y2="129.54" width="0.1524" layer="94" style="longdash"/>
<wire x1="25.4" y1="129.54" x2="63.5" y2="129.54" width="0.1524" layer="94" style="longdash"/>
<wire x1="63.5" y1="129.54" x2="63.5" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<wire x1="63.5" y1="165.1" x2="25.4" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<text x="216.916" y="20.574" size="2.286" layer="94" font="vector">Conectores</text>
<wire x1="63.5" y1="124.46" x2="25.4" y2="124.46" width="0.1524" layer="94" style="longdash"/>
<wire x1="25.4" y1="124.46" x2="25.4" y2="96.52" width="0.1524" layer="94" style="longdash"/>
<wire x1="25.4" y1="96.52" x2="63.5" y2="96.52" width="0.1524" layer="94" style="longdash"/>
<wire x1="63.5" y1="96.52" x2="63.5" y2="124.46" width="0.1524" layer="94" style="longdash"/>
<text x="27.94" y="119.38" size="2.286" layer="97">Alimentación y CAN</text>
<wire x1="25.4" y1="63.5" x2="63.5" y2="63.5" width="0.1524" layer="94" style="longdash"/>
<wire x1="63.5" y1="63.5" x2="63.5" y2="91.44" width="0.1524" layer="94" style="longdash"/>
<wire x1="63.5" y1="91.44" x2="25.4" y2="91.44" width="0.1524" layer="94" style="longdash"/>
<wire x1="25.4" y1="91.44" x2="25.4" y2="63.5" width="0.1524" layer="94" style="longdash"/>
<text x="27.94" y="86.36" size="2.286" layer="97">PC USART</text>
<wire x1="83.82" y1="165.1" x2="144.78" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="165.1" x2="144.78" y2="134.62" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="134.62" x2="83.82" y2="134.62" width="0.1524" layer="94" style="longdash"/>
<wire x1="83.82" y1="134.62" x2="83.82" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<text x="86.36" y="160.02" size="2.286" layer="97">CAMERA</text>
<wire x1="83.82" y1="101.6" x2="144.78" y2="101.6" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="101.6" x2="144.78" y2="129.54" width="0.1524" layer="94" style="longdash"/>
<wire x1="144.78" y1="129.54" x2="83.82" y2="129.54" width="0.1524" layer="94" style="longdash"/>
<wire x1="83.82" y1="129.54" x2="83.82" y2="101.6" width="0.1524" layer="94" style="longdash"/>
<text x="86.36" y="124.46" size="2.286" layer="97">LEDS FLASH</text>
<wire x1="238.76" y1="165.1" x2="187.96" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<wire x1="187.96" y1="165.1" x2="187.96" y2="81.28" width="0.1524" layer="94" style="longdash"/>
<wire x1="238.76" y1="81.28" x2="238.76" y2="165.1" width="0.1524" layer="94" style="longdash"/>
<wire x1="187.96" y1="81.28" x2="238.76" y2="81.28" width="0.1524" layer="94" style="longdash"/>
<text x="190.5" y="160.02" size="2.286" layer="97">MECANICA</text>
</plain>
<instances>
<instance part="FRAME2" gate="G$1" x="0" y="0"/>
<instance part="GND15" gate="1" x="94.488" y="147.32"/>
<instance part="J1" gate="-1" x="124.46" y="152.4"/>
<instance part="J1" gate="-2" x="124.46" y="149.86"/>
<instance part="J1" gate="-3" x="124.46" y="147.32"/>
<instance part="J1" gate="-4" x="124.46" y="144.78"/>
<instance part="J2" gate="-1" x="50.8" y="111.76"/>
<instance part="J2" gate="-2" x="50.8" y="109.22"/>
<instance part="J2" gate="-4" x="50.8" y="104.14"/>
<instance part="J2" gate="-3" x="50.8" y="106.68"/>
<instance part="H1" gate="G$1" x="198.12" y="142.24"/>
<instance part="H2" gate="G$1" x="198.12" y="134.62"/>
<instance part="H3" gate="G$1" x="198.12" y="127"/>
<instance part="H4" gate="G$1" x="198.12" y="119.38"/>
<instance part="H5" gate="G$1" x="198.12" y="111.76"/>
<instance part="H6" gate="G$1" x="198.12" y="104.14"/>
<instance part="H7" gate="G$1" x="198.12" y="96.52"/>
<instance part="J4" gate="-1" x="137.16" y="119.38"/>
<instance part="J4" gate="-2" x="137.16" y="116.84"/>
<instance part="J4" gate="-4" x="137.16" y="111.76"/>
<instance part="J4" gate="-3" x="137.16" y="114.3"/>
<instance part="R23" gate="G$1" x="109.22" y="116.84"/>
<instance part="R24" gate="G$1" x="119.38" y="111.76"/>
<instance part="J3" gate="-1" x="55.88" y="78.74"/>
<instance part="J3" gate="-2" x="55.88" y="76.2"/>
<instance part="J3" gate="-3" x="55.88" y="73.66"/>
<instance part="JTAG" gate="-1" x="53.34" y="152.4"/>
<instance part="JTAG" gate="-2" x="53.34" y="149.86"/>
<instance part="JTAG" gate="-3" x="53.34" y="147.32"/>
<instance part="JTAG" gate="-4" x="53.34" y="144.78"/>
<instance part="JTAG" gate="-5" x="53.34" y="142.24"/>
<instance part="JTAG" gate="-6" x="53.34" y="139.7"/>
<instance part="JTAG" gate="-7" x="53.34" y="137.16"/>
<instance part="JTAG" gate="-8" x="53.34" y="134.62"/>
</instances>
<busses>
</busses>
<nets>
<net name="JTAG_TMS" class="0">
<segment>
<wire x1="48.26" y1="152.4" x2="43.18" y2="152.4" width="0.1524" layer="91" style="longdash"/>
<label x="43.18" y="152.4" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-1" pin="1"/>
</segment>
</net>
<net name="JTAG_TDO" class="0">
<segment>
<wire x1="48.26" y1="149.86" x2="43.18" y2="149.86" width="0.1524" layer="91" style="longdash"/>
<label x="43.18" y="149.86" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-2" pin="1"/>
</segment>
</net>
<net name="JTAG_TCK" class="0">
<segment>
<wire x1="48.26" y1="147.32" x2="43.18" y2="147.32" width="0.1524" layer="91" style="longdash"/>
<label x="43.18" y="147.32" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-3" pin="1"/>
</segment>
</net>
<net name="JTAG_TDI" class="0">
<segment>
<wire x1="48.26" y1="142.24" x2="43.18" y2="142.24" width="0.1524" layer="91" style="longdash"/>
<label x="43.18" y="142.24" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-5" pin="1"/>
</segment>
</net>
<net name="RESETN" class="0">
<segment>
<wire x1="48.26" y1="144.78" x2="43.18" y2="144.78" width="0.1524" layer="91" style="longdash"/>
<label x="43.18" y="144.78" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-4" pin="1"/>
</segment>
</net>
<net name="VCC_IN" class="0">
<segment>
<pinref part="J2" gate="-2" pin="1"/>
<wire x1="45.72" y1="109.22" x2="43.18" y2="109.22" width="0.1524" layer="91"/>
<label x="43.18" y="109.22" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="48.26" y1="137.16" x2="43.18" y2="137.16" width="0.1524" layer="91"/>
<label x="43.18" y="137.16" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-7" pin="1"/>
</segment>
<segment>
<pinref part="GND15" gate="1" pin="GND"/>
<wire x1="119.38" y1="149.86" x2="94.488" y2="149.86" width="0.1524" layer="91"/>
<pinref part="J1" gate="-2" pin="1"/>
</segment>
<segment>
<pinref part="J2" gate="-1" pin="1"/>
<wire x1="45.72" y1="111.76" x2="43.18" y2="111.76" width="0.1524" layer="91"/>
<label x="43.18" y="111.76" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J3" gate="-3" pin="1"/>
<wire x1="50.8" y1="73.66" x2="48.26" y2="73.66" width="0.1524" layer="91"/>
<label x="48.26" y="73.66" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="VDD_33" class="0">
<segment>
<wire x1="48.26" y1="139.7" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<label x="43.18" y="139.7" size="1.778" layer="95" rot="MR0"/>
<pinref part="JTAG" gate="-6" pin="1"/>
</segment>
<segment>
<pinref part="J4" gate="-1" pin="1"/>
<wire x1="132.08" y1="119.38" x2="129.54" y2="119.38" width="0.1524" layer="91"/>
<label x="129.54" y="119.38" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J4" gate="-3" pin="1"/>
<wire x1="132.08" y1="114.3" x2="129.54" y2="114.3" width="0.1524" layer="91"/>
<label x="129.54" y="114.3" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="UARTCAM-RXD" class="0">
<segment>
<wire x1="119.38" y1="147.32" x2="116.84" y2="147.32" width="0.1524" layer="91"/>
<pinref part="J1" gate="-3" pin="1"/>
<label x="116.84" y="147.32" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="UARTCAM-TXD" class="0">
<segment>
<wire x1="119.38" y1="144.78" x2="116.84" y2="144.78" width="0.1524" layer="91"/>
<pinref part="J1" gate="-4" pin="1"/>
<label x="116.84" y="144.78" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="UARTPC-RXD(2)" class="0">
<segment>
<pinref part="J3" gate="-1" pin="1"/>
<wire x1="50.8" y1="78.74" x2="48.26" y2="78.74" width="0.1524" layer="91"/>
<label x="48.26" y="78.74" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="UARTPC-TXD(3)" class="0">
<segment>
<pinref part="J3" gate="-2" pin="1"/>
<wire x1="50.8" y1="76.2" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
<label x="48.26" y="76.2" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="CAN_H" class="0">
<segment>
<pinref part="J2" gate="-3" pin="1"/>
<wire x1="45.72" y1="106.68" x2="43.18" y2="106.68" width="0.1524" layer="91"/>
<label x="43.18" y="106.68" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="CAN_L" class="0">
<segment>
<pinref part="J2" gate="-4" pin="1"/>
<wire x1="45.72" y1="104.14" x2="43.18" y2="104.14" width="0.1524" layer="91"/>
<label x="43.18" y="104.14" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="J4" gate="-2" pin="1"/>
<pinref part="R23" gate="G$1" pin="P$2"/>
<wire x1="114.3" y1="116.84" x2="132.08" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="J4" gate="-4" pin="1"/>
<pinref part="R24" gate="G$1" pin="P$2"/>
<wire x1="124.46" y1="111.76" x2="132.08" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_FLASH1" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="P$1"/>
<wire x1="104.14" y1="116.84" x2="101.6" y2="116.84" width="0.1524" layer="91"/>
<label x="101.6" y="116.84" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="LED_FLASH2" class="0">
<segment>
<pinref part="R24" gate="G$1" pin="P$1"/>
<wire x1="114.3" y1="111.76" x2="101.6" y2="111.76" width="0.1524" layer="91"/>
<label x="101.6" y="111.76" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="VDD_CAMARA" class="0">
<segment>
<pinref part="J1" gate="-1" pin="1"/>
<wire x1="119.38" y1="152.4" x2="116.84" y2="152.4" width="0.1524" layer="91"/>
<label x="116.84" y="152.4" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
