{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 411.0, 376.0, 761.0, 483.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 201.0, 325.0, 5.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.0, 233.0, 6.0, 66.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 338.0, 264.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 338.0, 235.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 217.0, 325.0, 81.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 34.0, 243.0, 45.0, 20.0 ],
					"text" : "Preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 505.0, 294.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 354.0, 83.0, 22.0 ],
					"text" : "prepend store"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 217.0, 354.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 34.0, 266.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "number",
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 338.0, 294.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 62.0, 267.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 338.0, 354.0, 54.0, 22.0 ],
					"text" : "recall $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 217.0, 392.0, 52.0, 22.0 ],
					"text" : "store 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 505.0, 378.0, 103.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 262.0, 267.0, 103.0, 22.0 ],
					"text" : "write storage.json"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 505.0, 354.0, 101.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 262.0, 243.0, 101.0, 22.0 ],
					"text" : "read storage.json"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.0, 378.0, 89.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.0, 267.0, 89.0, 22.0 ],
					"text" : "storagewindow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.0, 354.0, 77.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.0, 243.0, 77.0, 22.0 ],
					"text" : "clientwindow"
				}

			}
, 			{
				"box" : 				{
					"autorestore" : "storage.json",
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.0, 464.0, 73.0, 22.0 ],
					"saved_object_attributes" : 					{
						"client_rect" : [ 4, 44, 358, 172 ],
						"parameter_enable" : 0,
						"parameter_mappable" : 0,
						"storage_rect" : [ 365, 44, 816, 172 ]
					}
,
					"text" : "pattrstorage",
					"varname" : "u942000314"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 246.0, 57.0, 22.0 ],
					"text" : "vaporsys"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 294.0, 42.0, 22.0 ],
					"text" : "icesys",
					"varname" : "icesys"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "mixer.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 217.0, 18.0, 422.0, 199.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.0, 9.0, 345.0, 203.0 ],
					"varname" : "mixer",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 270.0, 56.0, 22.0 ],
					"text" : "watersys",
					"varname" : "watersys"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 124.0, 25.0, 22.0 ],
					"text" : "evt",
					"varname" : "evt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 18.0, 108.0, 20.0 ],
					"text" : "NO TOUCHING!!!!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 43.0, 81.0, 22.0 ],
					"text" : "osc_manager"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"order" : 1,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-2::obj-27.5::obj-21" : [ "live.gain~[7]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.3::obj-14" : [ "ws_freq[2]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.32::obj-14" : [ "ws_freq[31]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.19::obj-14" : [ "ws_freq[18]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.47::obj-14" : [ "ws_freq[46]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.13::obj-4" : [ "live.gain~[56]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.15::obj-4" : [ "live.gain~[58]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.30::obj-38" : [ "live.dial[47]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.63::obj-14" : [ "ws_freq[62]", "Freq", 0 ],
			"obj-2::obj-27.7::obj-23" : [ "live.dial[6]", "live.dial", 0 ],
			"obj-4::obj-16" : [ "rvb_damping", "Damping", 0 ],
			"obj-2::obj-39::obj-46.8::obj-14" : [ "ws_freq[7]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.37::obj-14" : [ "ws_freq[36]", "Freq", 0 ],
			"obj-6::obj-15.3::obj-8" : [ "live.gain~[25]", "live.gain~[12]", 0 ],
			"obj-2::obj-27.7::obj-21" : [ "live.gain~[16]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.23::obj-14" : [ "ws_freq[22]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.52::obj-14" : [ "ws_freq[51]", "Freq", 0 ],
			"obj-4::obj-32" : [ "live.dial[21]", "live.dial[20]", 0 ],
			"obj-4::obj-25" : [ "vapor_vol", "Vapor", 0 ],
			"obj-5::obj-5::obj-60.5::obj-38" : [ "live.dial[11]", "live.dial[29]", 0 ],
			"obj-6::obj-15.13::obj-8" : [ "live.gain~[35]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.25::obj-4" : [ "live.gain~[68]", "live.gain~[43]", 0 ],
			"obj-2::obj-39::obj-46.26::obj-14" : [ "ws_freq[25]", "Freq", 0 ],
			"obj-6::obj-15.6::obj-8" : [ "live.gain~[28]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.10::obj-38" : [ "live.dial[16]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.18::obj-38" : [ "live.dial[35]", "live.dial[29]", 0 ],
			"obj-1::obj-79::obj-12" : [ "live.gain~[11]", "live.gain~[11]", 0 ],
			"obj-2::obj-27.4::obj-21" : [ "live.gain~[5]", "live.gain~", 0 ],
			"obj-2::obj-27.10::obj-23" : [ "live.dial[18]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.13::obj-14" : [ "ws_freq[12]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.41::obj-14" : [ "ws_freq[40]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.7::obj-4" : [ "live.gain~[50]", "live.gain~[43]", 0 ],
			"obj-2::obj-39::obj-46.1::obj-14" : [ "ws_freq", "Freq", 0 ],
			"obj-2::obj-39::obj-46.57::obj-14" : [ "ws_freq[56]", "Freq", 0 ],
			"obj-6::obj-15.16::obj-8" : [ "live.gain~[38]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.19::obj-4" : [ "live.gain~[62]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.1::obj-23" : [ "live.dial", "live.dial", 0 ],
			"obj-6::obj-15.19::obj-8" : [ "live.gain~[41]", "live.gain~[12]", 0 ],
			"obj-2::obj-39::obj-46.2::obj-14" : [ "ws_freq[1]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.31::obj-14" : [ "ws_freq[30]", "Freq", 0 ],
			"obj-2::obj-27.5::obj-23" : [ "live.dial[4]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.18::obj-14" : [ "ws_freq[17]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.46::obj-14" : [ "ws_freq[45]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.9::obj-38" : [ "live.dial[15]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.17::obj-4" : [ "live.gain~[60]", "live.gain~[43]", 0 ],
			"obj-2::obj-39::obj-46.62::obj-14" : [ "ws_freq[61]", "Freq", 0 ],
			"obj-2::obj-27.6::obj-65" : [ "live.gain~[10]", "live.gain~[34]", 0 ],
			"obj-4::obj-27" : [ "live.dial[20]", "live.dial[20]", 0 ],
			"obj-4::obj-33" : [ "idle_vol", "Idle", 0 ],
			"obj-5::obj-5::obj-60.1::obj-38" : [ "live.dial[29]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.4::obj-38" : [ "live.dial[10]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.7::obj-14" : [ "ws_freq[6]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.36::obj-14" : [ "ws_freq[35]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.9::obj-4" : [ "live.gain~[52]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.27::obj-38" : [ "live.dial[44]", "live.dial[29]", 0 ],
			"obj-2::obj-27.9::obj-65" : [ "live.gain~[14]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.22::obj-14" : [ "ws_freq[21]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.51::obj-14" : [ "ws_freq[50]", "Freq", 0 ],
			"obj-4::obj-14" : [ "rvb_size", "Size", 0 ],
			"obj-5::obj-5::obj-60.3::obj-4" : [ "live.gain~[46]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.14::obj-38" : [ "live.dial[17]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.21::obj-38" : [ "live.dial[38]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.31::obj-4" : [ "live.gain~[74]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.2::obj-65" : [ "live.gain~[2]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.12::obj-14" : [ "ws_freq[11]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.40::obj-14" : [ "ws_freq[39]", "Freq", 0 ],
			"obj-6::obj-15.9::obj-8" : [ "live.gain~[31]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.23::obj-4" : [ "live.gain~[66]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.9::obj-21" : [ "live.gain~[19]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.56::obj-14" : [ "ws_freq[55]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.8::obj-38" : [ "live.dial[14]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.20::obj-4" : [ "live.gain~[63]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.28::obj-38" : [ "live.dial[45]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.25::obj-14" : [ "ws_freq[24]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.30::obj-14" : [ "ws_freq[29]", "Freq", 0 ],
			"obj-6::obj-15.12::obj-8" : [ "live.gain~[34]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.5::obj-4" : [ "live.gain~[48]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.20::obj-38" : [ "live.dial[37]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.17::obj-14" : [ "ws_freq[16]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.45::obj-14" : [ "ws_freq[44]", "Freq", 0 ],
			"obj-2::obj-27.6::obj-21" : [ "live.gain~[9]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.61::obj-14" : [ "ws_freq[60]", "Freq", 0 ],
			"obj-6::obj-15.5::obj-8" : [ "live.gain~[27]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.13::obj-38" : [ "live.dial[32]", "live.dial[29]", 0 ],
			"obj-2::obj-27.6::obj-23" : [ "live.dial[5]", "live.dial", 0 ],
			"obj-4::obj-20" : [ "ice_vol", "Ice", 0 ],
			"obj-6::obj-15.20::obj-8" : [ "live.gain~[42]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.29::obj-38" : [ "live.dial[46]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.6::obj-14" : [ "ws_freq[5]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.35::obj-14" : [ "ws_freq[34]", "Freq", 0 ],
			"obj-6::obj-15.17::obj-8" : [ "live.gain~[39]", "live.gain~[12]", 0 ],
			"obj-2::obj-39::obj-46.50::obj-14" : [ "ws_freq[49]", "Freq", 0 ],
			"obj-4::obj-15" : [ "rvb_decay", "Decay", 0 ],
			"obj-5::obj-5::obj-60.32::obj-38" : [ "live.dial[49]", "live.dial[29]", 0 ],
			"obj-6::obj-1::obj-30" : [ "live.gain~[22]", "live.gain~[8]", 0 ],
			"obj-5::obj-5::obj-60.21::obj-4" : [ "live.gain~[64]", "live.gain~[43]", 0 ],
			"obj-4::obj-40" : [ "live.dial[22]", "live.dial[20]", 0 ],
			"obj-2::obj-39::obj-46.11::obj-14" : [ "ws_freq[10]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.39::obj-14" : [ "ws_freq[38]", "Freq", 0 ],
			"obj-6::obj-15.11::obj-8" : [ "live.gain~[33]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.14::obj-4" : [ "live.gain~[57]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.15::obj-38" : [ "live.dial[25]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.24::obj-38" : [ "live.dial[41]", "live.dial[29]", 0 ],
			"obj-2::obj-27.9::obj-23" : [ "live.dial[19]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.55::obj-14" : [ "ws_freq[54]", "Freq", 0 ],
			"obj-6::obj-15.2::obj-8" : [ "live.gain~[24]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.17::obj-38" : [ "live.dial[34]", "live.dial[29]", 0 ],
			"obj-2::obj-27.3::obj-21" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.29::obj-14" : [ "ws_freq[28]", "Freq", 0 ],
			"obj-2::obj-39::obj-30" : [ "live.gain~[21]", "live.gain~[8]", 0 ],
			"obj-6::obj-15.7::obj-8" : [ "live.gain~[29]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.26::obj-38" : [ "live.dial[43]", "live.dial[29]", 0 ],
			"obj-2::obj-27.4::obj-23" : [ "live.dial[3]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.16::obj-14" : [ "ws_freq[15]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.44::obj-14" : [ "ws_freq[43]", "Freq", 0 ],
			"obj-6::obj-15.14::obj-8" : [ "live.gain~[36]", "live.gain~[12]", 0 ],
			"obj-2::obj-39::obj-46.60::obj-14" : [ "ws_freq[59]", "Freq", 0 ],
			"obj-4::obj-28" : [ "evt_vol", "Events", 0 ],
			"obj-5::obj-5::obj-60.2::obj-38" : [ "live.dial[8]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.16::obj-4" : [ "live.gain~[59]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.24::obj-4" : [ "live.gain~[67]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.26::obj-4" : [ "live.gain~[69]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.28::obj-4" : [ "live.gain~[71]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.30::obj-4" : [ "live.gain~[73]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.31::obj-38" : [ "live.dial[48]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-46.5::obj-14" : [ "ws_freq[4]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.34::obj-14" : [ "ws_freq[33]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.21::obj-14" : [ "ws_freq[20]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.49::obj-14" : [ "ws_freq[48]", "Freq", 0 ],
			"obj-4::obj-12" : [ "master_gain", "Master", 0 ],
			"obj-6::obj-15.1::obj-8" : [ "live.gain~[23]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.3::obj-38" : [ "live.dial[9]", "live.dial[29]", 0 ],
			"obj-2::obj-39::obj-41" : [ "live.dial[28]", "Dry/Wet", 0 ],
			"obj-5::obj-5::obj-60.6::obj-4" : [ "live.gain~[49]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.8::obj-4" : [ "live.gain~[51]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.23::obj-38" : [ "live.dial[40]", "live.dial[29]", 0 ],
			"obj-2::obj-27.7::obj-65" : [ "live.gain~[12]", "live.gain~[34]", 0 ],
			"obj-2::obj-27.8::obj-21" : [ "live.gain~[13]", "live.gain~", 0 ],
			"obj-2::obj-27.2::obj-23" : [ "live.dial[1]", "live.dial", 0 ],
			"obj-2::obj-27.10::obj-21" : [ "live.gain~[18]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.10::obj-14" : [ "ws_freq[9]", "Freq", 0 ],
			"obj-6::obj-15.18::obj-8" : [ "live.gain~[40]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.2::obj-4" : [ "live.gain~[45]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.29::obj-4" : [ "live.gain~[72]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.10::obj-65" : [ "live.gain~[20]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.54::obj-14" : [ "ws_freq[53]", "Freq", 0 ],
			"obj-6::obj-15.15::obj-8" : [ "live.gain~[37]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.12::obj-38" : [ "live.dial[31]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.19::obj-38" : [ "live.dial[36]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.1::obj-4" : [ "live.gain~[43]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.12::obj-4" : [ "live.gain~[55]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.2::obj-21" : [ "live.gain~[1]", "live.gain~", 0 ],
			"obj-2::obj-39::obj-46.28::obj-14" : [ "ws_freq[27]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.7::obj-38" : [ "live.dial[13]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.27::obj-4" : [ "live.gain~[70]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.32::obj-4" : [ "live.gain~[75]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.4::obj-65" : [ "live.gain~[6]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.15::obj-14" : [ "ws_freq[14]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.43::obj-14" : [ "ws_freq[42]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.59::obj-14" : [ "ws_freq[58]", "Freq", 0 ],
			"obj-2::obj-21" : [ "live.gain~[44]", "live.gain~[44]", 0 ],
			"obj-5::obj-5::obj-60.4::obj-4" : [ "live.gain~[47]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.11::obj-38" : [ "live.dial[30]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.18::obj-4" : [ "live.gain~[61]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.5::obj-65" : [ "live.gain~[8]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.4::obj-14" : [ "ws_freq[3]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.33::obj-14" : [ "ws_freq[32]", "Freq", 0 ],
			"obj-6::obj-15.4::obj-8" : [ "live.gain~[26]", "live.gain~[12]", 0 ],
			"obj-2::obj-39::obj-46.20::obj-14" : [ "ws_freq[19]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.48::obj-14" : [ "ws_freq[47]", "Freq", 0 ],
			"obj-4::obj-42" : [ "live.dial[24]", "live.dial[20]", 0 ],
			"obj-5::obj-5::obj-60.6::obj-38" : [ "live.dial[12]", "live.dial[29]", 0 ],
			"obj-5::obj-5::obj-60.22::obj-4" : [ "live.gain~[65]", "live.gain~[43]", 0 ],
			"obj-2::obj-39::obj-46.64::obj-14" : [ "ws_freq[63]", "Freq", 0 ],
			"obj-6::obj-15.8::obj-8" : [ "live.gain~[30]", "live.gain~[12]", 0 ],
			"obj-5::obj-5::obj-60.10::obj-4" : [ "live.gain~[53]", "live.gain~[43]", 0 ],
			"obj-2::obj-27.8::obj-65" : [ "live.gain~[17]", "live.gain~[34]", 0 ],
			"obj-4::obj-41" : [ "live.dial[23]", "live.dial[20]", 0 ],
			"obj-4::obj-17" : [ "rvb_diff", "Diffusion", 0 ],
			"obj-2::obj-39::obj-46.9::obj-14" : [ "ws_freq[8]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.38::obj-14" : [ "ws_freq[37]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.11::obj-4" : [ "live.gain~[54]", "live.gain~[43]", 0 ],
			"obj-5::obj-5::obj-60.16::obj-38" : [ "live.dial[33]", "live.dial[29]", 0 ],
			"obj-2::obj-27.8::obj-23" : [ "live.dial[7]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.24::obj-14" : [ "ws_freq[23]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.53::obj-14" : [ "ws_freq[52]", "Freq", 0 ],
			"obj-4::obj-3" : [ "water_vol", "Water", 0 ],
			"obj-5::obj-5::obj-60.25::obj-38" : [ "live.dial[42]", "live.dial[29]", 0 ],
			"obj-2::obj-27.3::obj-65" : [ "live.gain~[4]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-18" : [ "live.dial[27]", "Delay", 0 ],
			"obj-6::obj-15.10::obj-8" : [ "live.gain~[32]", "live.gain~[12]", 0 ],
			"obj-2::obj-39::obj-46.27::obj-14" : [ "ws_freq[26]", "Freq", 0 ],
			"obj-2::obj-27.3::obj-23" : [ "live.dial[2]", "live.dial", 0 ],
			"obj-2::obj-39::obj-46.14::obj-14" : [ "ws_freq[13]", "Freq", 0 ],
			"obj-2::obj-39::obj-46.42::obj-14" : [ "ws_freq[41]", "Freq", 0 ],
			"obj-2::obj-27.1::obj-21" : [ "live.gain~", "live.gain~", 0 ],
			"obj-2::obj-27.1::obj-65" : [ "live.gain~[15]", "live.gain~[34]", 0 ],
			"obj-2::obj-39::obj-46.58::obj-14" : [ "ws_freq[57]", "Freq", 0 ],
			"obj-5::obj-5::obj-60.22::obj-38" : [ "live.dial[39]", "live.dial[29]", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-2::obj-27.5::obj-21" : 				{
					"parameter_longname" : "live.gain~[7]"
				}
,
				"obj-2::obj-39::obj-46.3::obj-14" : 				{
					"parameter_longname" : "ws_freq[2]"
				}
,
				"obj-2::obj-39::obj-46.32::obj-14" : 				{
					"parameter_longname" : "ws_freq[31]"
				}
,
				"obj-2::obj-39::obj-46.19::obj-14" : 				{
					"parameter_longname" : "ws_freq[18]"
				}
,
				"obj-2::obj-39::obj-46.47::obj-14" : 				{
					"parameter_longname" : "ws_freq[46]"
				}
,
				"obj-5::obj-5::obj-60.13::obj-4" : 				{
					"parameter_longname" : "live.gain~[56]"
				}
,
				"obj-5::obj-5::obj-60.15::obj-4" : 				{
					"parameter_longname" : "live.gain~[58]"
				}
,
				"obj-5::obj-5::obj-60.30::obj-38" : 				{
					"parameter_longname" : "live.dial[47]"
				}
,
				"obj-2::obj-39::obj-46.63::obj-14" : 				{
					"parameter_longname" : "ws_freq[62]"
				}
,
				"obj-2::obj-27.7::obj-23" : 				{
					"parameter_longname" : "live.dial[6]"
				}
,
				"obj-4::obj-16" : 				{
					"parameter_longname" : "rvb_damping",
					"parameter_linknames" : 1,
					"parameter_shortname" : "Damping"
				}
,
				"obj-2::obj-39::obj-46.8::obj-14" : 				{
					"parameter_longname" : "ws_freq[7]"
				}
,
				"obj-2::obj-39::obj-46.37::obj-14" : 				{
					"parameter_longname" : "ws_freq[36]"
				}
,
				"obj-6::obj-15.3::obj-8" : 				{
					"parameter_longname" : "live.gain~[25]"
				}
,
				"obj-2::obj-27.7::obj-21" : 				{
					"parameter_longname" : "live.gain~[16]"
				}
,
				"obj-2::obj-39::obj-46.23::obj-14" : 				{
					"parameter_longname" : "ws_freq[22]"
				}
,
				"obj-2::obj-39::obj-46.52::obj-14" : 				{
					"parameter_longname" : "ws_freq[51]"
				}
,
				"obj-4::obj-32" : 				{
					"parameter_longname" : "live.dial[21]",
					"parameter_range" : [ 0.0, 1.0 ]
				}
,
				"obj-4::obj-25" : 				{
					"parameter_longname" : "vapor_vol",
					"parameter_shortname" : "Vapor"
				}
,
				"obj-5::obj-5::obj-60.5::obj-38" : 				{
					"parameter_longname" : "live.dial[11]"
				}
,
				"obj-6::obj-15.13::obj-8" : 				{
					"parameter_longname" : "live.gain~[35]"
				}
,
				"obj-5::obj-5::obj-60.25::obj-4" : 				{
					"parameter_longname" : "live.gain~[68]"
				}
,
				"obj-2::obj-39::obj-46.26::obj-14" : 				{
					"parameter_longname" : "ws_freq[25]"
				}
,
				"obj-6::obj-15.6::obj-8" : 				{
					"parameter_longname" : "live.gain~[28]"
				}
,
				"obj-5::obj-5::obj-60.10::obj-38" : 				{
					"parameter_longname" : "live.dial[16]"
				}
,
				"obj-5::obj-5::obj-60.18::obj-38" : 				{
					"parameter_longname" : "live.dial[35]"
				}
,
				"obj-2::obj-27.4::obj-21" : 				{
					"parameter_longname" : "live.gain~[5]"
				}
,
				"obj-2::obj-27.10::obj-23" : 				{
					"parameter_longname" : "live.dial[18]"
				}
,
				"obj-2::obj-39::obj-46.13::obj-14" : 				{
					"parameter_longname" : "ws_freq[12]"
				}
,
				"obj-2::obj-39::obj-46.41::obj-14" : 				{
					"parameter_longname" : "ws_freq[40]"
				}
,
				"obj-5::obj-5::obj-60.7::obj-4" : 				{
					"parameter_longname" : "live.gain~[50]"
				}
,
				"obj-2::obj-39::obj-46.57::obj-14" : 				{
					"parameter_longname" : "ws_freq[56]"
				}
,
				"obj-6::obj-15.16::obj-8" : 				{
					"parameter_longname" : "live.gain~[38]"
				}
,
				"obj-5::obj-5::obj-60.19::obj-4" : 				{
					"parameter_longname" : "live.gain~[62]"
				}
,
				"obj-2::obj-27.1::obj-23" : 				{
					"parameter_longname" : "live.dial",
					"parameter_shortname" : "live.dial",
					"parameter_unitstyle" : 8
				}
,
				"obj-6::obj-15.19::obj-8" : 				{
					"parameter_longname" : "live.gain~[41]"
				}
,
				"obj-2::obj-39::obj-46.2::obj-14" : 				{
					"parameter_longname" : "ws_freq[1]"
				}
,
				"obj-2::obj-39::obj-46.31::obj-14" : 				{
					"parameter_longname" : "ws_freq[30]"
				}
,
				"obj-2::obj-27.5::obj-23" : 				{
					"parameter_longname" : "live.dial[4]"
				}
,
				"obj-2::obj-39::obj-46.18::obj-14" : 				{
					"parameter_longname" : "ws_freq[17]"
				}
,
				"obj-2::obj-39::obj-46.46::obj-14" : 				{
					"parameter_longname" : "ws_freq[45]"
				}
,
				"obj-5::obj-5::obj-60.9::obj-38" : 				{
					"parameter_longname" : "live.dial[15]"
				}
,
				"obj-5::obj-5::obj-60.17::obj-4" : 				{
					"parameter_longname" : "live.gain~[60]"
				}
,
				"obj-2::obj-39::obj-46.62::obj-14" : 				{
					"parameter_longname" : "ws_freq[61]"
				}
,
				"obj-2::obj-27.6::obj-65" : 				{
					"parameter_longname" : "live.gain~[10]"
				}
,
				"obj-4::obj-27" : 				{
					"parameter_longname" : "live.dial[20]",
					"parameter_shortname" : "live.dial[20]",
					"parameter_range" : [ 0.0, 1.0 ],
					"parameter_unitstyle" : 1,
					"parameter_exponent" : 2.0
				}
,
				"obj-4::obj-33" : 				{
					"parameter_longname" : "idle_vol",
					"parameter_shortname" : "Idle",
					"parameter_linknames" : 1
				}
,
				"obj-5::obj-5::obj-60.4::obj-38" : 				{
					"parameter_longname" : "live.dial[10]"
				}
,
				"obj-2::obj-39::obj-46.7::obj-14" : 				{
					"parameter_longname" : "ws_freq[6]"
				}
,
				"obj-2::obj-39::obj-46.36::obj-14" : 				{
					"parameter_longname" : "ws_freq[35]"
				}
,
				"obj-5::obj-5::obj-60.9::obj-4" : 				{
					"parameter_longname" : "live.gain~[52]"
				}
,
				"obj-5::obj-5::obj-60.27::obj-38" : 				{
					"parameter_longname" : "live.dial[44]"
				}
,
				"obj-2::obj-27.9::obj-65" : 				{
					"parameter_longname" : "live.gain~[14]"
				}
,
				"obj-2::obj-39::obj-46.22::obj-14" : 				{
					"parameter_longname" : "ws_freq[21]"
				}
,
				"obj-2::obj-39::obj-46.51::obj-14" : 				{
					"parameter_longname" : "ws_freq[50]"
				}
,
				"obj-4::obj-14" : 				{
					"parameter_longname" : "rvb_size",
					"parameter_linknames" : 1,
					"parameter_shortname" : "Size"
				}
,
				"obj-5::obj-5::obj-60.3::obj-4" : 				{
					"parameter_longname" : "live.gain~[46]"
				}
,
				"obj-5::obj-5::obj-60.14::obj-38" : 				{
					"parameter_longname" : "live.dial[17]"
				}
,
				"obj-5::obj-5::obj-60.21::obj-38" : 				{
					"parameter_longname" : "live.dial[38]"
				}
,
				"obj-5::obj-5::obj-60.31::obj-4" : 				{
					"parameter_longname" : "live.gain~[74]"
				}
,
				"obj-2::obj-27.2::obj-65" : 				{
					"parameter_longname" : "live.gain~[2]"
				}
,
				"obj-2::obj-39::obj-46.12::obj-14" : 				{
					"parameter_longname" : "ws_freq[11]"
				}
,
				"obj-2::obj-39::obj-46.40::obj-14" : 				{
					"parameter_longname" : "ws_freq[39]"
				}
,
				"obj-6::obj-15.9::obj-8" : 				{
					"parameter_longname" : "live.gain~[31]"
				}
,
				"obj-5::obj-5::obj-60.23::obj-4" : 				{
					"parameter_longname" : "live.gain~[66]"
				}
,
				"obj-2::obj-27.9::obj-21" : 				{
					"parameter_longname" : "live.gain~[19]"
				}
,
				"obj-2::obj-39::obj-46.56::obj-14" : 				{
					"parameter_longname" : "ws_freq[55]"
				}
,
				"obj-5::obj-5::obj-60.8::obj-38" : 				{
					"parameter_longname" : "live.dial[14]"
				}
,
				"obj-5::obj-5::obj-60.20::obj-4" : 				{
					"parameter_longname" : "live.gain~[63]"
				}
,
				"obj-5::obj-5::obj-60.28::obj-38" : 				{
					"parameter_longname" : "live.dial[45]"
				}
,
				"obj-2::obj-39::obj-46.25::obj-14" : 				{
					"parameter_longname" : "ws_freq[24]"
				}
,
				"obj-2::obj-39::obj-46.30::obj-14" : 				{
					"parameter_longname" : "ws_freq[29]"
				}
,
				"obj-6::obj-15.12::obj-8" : 				{
					"parameter_longname" : "live.gain~[34]"
				}
,
				"obj-5::obj-5::obj-60.5::obj-4" : 				{
					"parameter_longname" : "live.gain~[48]"
				}
,
				"obj-5::obj-5::obj-60.20::obj-38" : 				{
					"parameter_longname" : "live.dial[37]"
				}
,
				"obj-2::obj-39::obj-46.17::obj-14" : 				{
					"parameter_longname" : "ws_freq[16]"
				}
,
				"obj-2::obj-39::obj-46.45::obj-14" : 				{
					"parameter_longname" : "ws_freq[44]"
				}
,
				"obj-2::obj-27.6::obj-21" : 				{
					"parameter_longname" : "live.gain~[9]"
				}
,
				"obj-2::obj-39::obj-46.61::obj-14" : 				{
					"parameter_longname" : "ws_freq[60]"
				}
,
				"obj-6::obj-15.5::obj-8" : 				{
					"parameter_longname" : "live.gain~[27]"
				}
,
				"obj-5::obj-5::obj-60.13::obj-38" : 				{
					"parameter_longname" : "live.dial[32]"
				}
,
				"obj-2::obj-27.6::obj-23" : 				{
					"parameter_longname" : "live.dial[5]"
				}
,
				"obj-4::obj-20" : 				{
					"parameter_longname" : "ice_vol",
					"parameter_shortname" : "Ice",
					"parameter_linknames" : 1
				}
,
				"obj-6::obj-15.20::obj-8" : 				{
					"parameter_longname" : "live.gain~[42]"
				}
,
				"obj-5::obj-5::obj-60.29::obj-38" : 				{
					"parameter_longname" : "live.dial[46]"
				}
,
				"obj-2::obj-39::obj-46.6::obj-14" : 				{
					"parameter_longname" : "ws_freq[5]"
				}
,
				"obj-2::obj-39::obj-46.35::obj-14" : 				{
					"parameter_longname" : "ws_freq[34]"
				}
,
				"obj-6::obj-15.17::obj-8" : 				{
					"parameter_longname" : "live.gain~[39]"
				}
,
				"obj-2::obj-39::obj-46.50::obj-14" : 				{
					"parameter_longname" : "ws_freq[49]"
				}
,
				"obj-4::obj-15" : 				{
					"parameter_longname" : "rvb_decay",
					"parameter_linknames" : 1,
					"parameter_shortname" : "Decay"
				}
,
				"obj-5::obj-5::obj-60.32::obj-38" : 				{
					"parameter_longname" : "live.dial[49]"
				}
,
				"obj-6::obj-1::obj-30" : 				{
					"parameter_longname" : "live.gain~[22]"
				}
,
				"obj-5::obj-5::obj-60.21::obj-4" : 				{
					"parameter_longname" : "live.gain~[64]"
				}
,
				"obj-4::obj-40" : 				{
					"parameter_longname" : "live.dial[22]",
					"parameter_range" : [ 0.0, 1.0 ],
					"parameter_unitstyle" : 1
				}
,
				"obj-2::obj-39::obj-46.11::obj-14" : 				{
					"parameter_longname" : "ws_freq[10]"
				}
,
				"obj-2::obj-39::obj-46.39::obj-14" : 				{
					"parameter_longname" : "ws_freq[38]"
				}
,
				"obj-6::obj-15.11::obj-8" : 				{
					"parameter_longname" : "live.gain~[33]"
				}
,
				"obj-5::obj-5::obj-60.14::obj-4" : 				{
					"parameter_longname" : "live.gain~[57]"
				}
,
				"obj-5::obj-5::obj-60.15::obj-38" : 				{
					"parameter_longname" : "live.dial[25]"
				}
,
				"obj-5::obj-5::obj-60.24::obj-38" : 				{
					"parameter_longname" : "live.dial[41]"
				}
,
				"obj-2::obj-27.9::obj-23" : 				{
					"parameter_longname" : "live.dial[19]"
				}
,
				"obj-2::obj-39::obj-46.55::obj-14" : 				{
					"parameter_longname" : "ws_freq[54]"
				}
,
				"obj-6::obj-15.2::obj-8" : 				{
					"parameter_longname" : "live.gain~[24]"
				}
,
				"obj-5::obj-5::obj-60.17::obj-38" : 				{
					"parameter_longname" : "live.dial[34]"
				}
,
				"obj-2::obj-27.3::obj-21" : 				{
					"parameter_longname" : "live.gain~[3]"
				}
,
				"obj-2::obj-39::obj-46.29::obj-14" : 				{
					"parameter_longname" : "ws_freq[28]"
				}
,
				"obj-2::obj-39::obj-30" : 				{
					"parameter_longname" : "live.gain~[21]"
				}
,
				"obj-6::obj-15.7::obj-8" : 				{
					"parameter_longname" : "live.gain~[29]"
				}
,
				"obj-5::obj-5::obj-60.26::obj-38" : 				{
					"parameter_longname" : "live.dial[43]"
				}
,
				"obj-2::obj-27.4::obj-23" : 				{
					"parameter_longname" : "live.dial[3]"
				}
,
				"obj-2::obj-39::obj-46.16::obj-14" : 				{
					"parameter_longname" : "ws_freq[15]"
				}
,
				"obj-2::obj-39::obj-46.44::obj-14" : 				{
					"parameter_longname" : "ws_freq[43]"
				}
,
				"obj-6::obj-15.14::obj-8" : 				{
					"parameter_longname" : "live.gain~[36]"
				}
,
				"obj-2::obj-39::obj-46.60::obj-14" : 				{
					"parameter_longname" : "ws_freq[59]"
				}
,
				"obj-4::obj-28" : 				{
					"parameter_longname" : "evt_vol",
					"parameter_shortname" : "Events",
					"parameter_linknames" : 1
				}
,
				"obj-5::obj-5::obj-60.2::obj-38" : 				{
					"parameter_longname" : "live.dial[8]"
				}
,
				"obj-5::obj-5::obj-60.16::obj-4" : 				{
					"parameter_longname" : "live.gain~[59]"
				}
,
				"obj-5::obj-5::obj-60.24::obj-4" : 				{
					"parameter_longname" : "live.gain~[67]"
				}
,
				"obj-5::obj-5::obj-60.26::obj-4" : 				{
					"parameter_longname" : "live.gain~[69]"
				}
,
				"obj-5::obj-5::obj-60.28::obj-4" : 				{
					"parameter_longname" : "live.gain~[71]"
				}
,
				"obj-5::obj-5::obj-60.30::obj-4" : 				{
					"parameter_longname" : "live.gain~[73]"
				}
,
				"obj-5::obj-5::obj-60.31::obj-38" : 				{
					"parameter_longname" : "live.dial[48]"
				}
,
				"obj-2::obj-39::obj-46.5::obj-14" : 				{
					"parameter_longname" : "ws_freq[4]"
				}
,
				"obj-2::obj-39::obj-46.34::obj-14" : 				{
					"parameter_longname" : "ws_freq[33]"
				}
,
				"obj-2::obj-39::obj-46.21::obj-14" : 				{
					"parameter_longname" : "ws_freq[20]"
				}
,
				"obj-2::obj-39::obj-46.49::obj-14" : 				{
					"parameter_longname" : "ws_freq[48]"
				}
,
				"obj-4::obj-12" : 				{
					"parameter_longname" : "master_gain",
					"parameter_linknames" : 1
				}
,
				"obj-6::obj-15.1::obj-8" : 				{
					"parameter_longname" : "live.gain~[23]"
				}
,
				"obj-5::obj-5::obj-60.3::obj-38" : 				{
					"parameter_longname" : "live.dial[9]"
				}
,
				"obj-5::obj-5::obj-60.6::obj-4" : 				{
					"parameter_longname" : "live.gain~[49]"
				}
,
				"obj-5::obj-5::obj-60.8::obj-4" : 				{
					"parameter_longname" : "live.gain~[51]"
				}
,
				"obj-5::obj-5::obj-60.23::obj-38" : 				{
					"parameter_longname" : "live.dial[40]"
				}
,
				"obj-2::obj-27.7::obj-65" : 				{
					"parameter_longname" : "live.gain~[12]"
				}
,
				"obj-2::obj-27.8::obj-21" : 				{
					"parameter_longname" : "live.gain~[13]"
				}
,
				"obj-2::obj-27.2::obj-23" : 				{
					"parameter_longname" : "live.dial[1]"
				}
,
				"obj-2::obj-27.10::obj-21" : 				{
					"parameter_longname" : "live.gain~[18]"
				}
,
				"obj-2::obj-39::obj-46.10::obj-14" : 				{
					"parameter_longname" : "ws_freq[9]"
				}
,
				"obj-6::obj-15.18::obj-8" : 				{
					"parameter_longname" : "live.gain~[40]"
				}
,
				"obj-5::obj-5::obj-60.2::obj-4" : 				{
					"parameter_longname" : "live.gain~[45]"
				}
,
				"obj-5::obj-5::obj-60.29::obj-4" : 				{
					"parameter_longname" : "live.gain~[72]"
				}
,
				"obj-2::obj-27.10::obj-65" : 				{
					"parameter_longname" : "live.gain~[20]"
				}
,
				"obj-2::obj-39::obj-46.54::obj-14" : 				{
					"parameter_longname" : "ws_freq[53]"
				}
,
				"obj-6::obj-15.15::obj-8" : 				{
					"parameter_longname" : "live.gain~[37]"
				}
,
				"obj-5::obj-5::obj-60.12::obj-38" : 				{
					"parameter_longname" : "live.dial[31]"
				}
,
				"obj-5::obj-5::obj-60.19::obj-38" : 				{
					"parameter_longname" : "live.dial[36]"
				}
,
				"obj-5::obj-5::obj-60.1::obj-4" : 				{
					"parameter_longname" : "live.gain~[43]",
					"parameter_shortname" : "live.gain~[43]"
				}
,
				"obj-5::obj-5::obj-60.12::obj-4" : 				{
					"parameter_longname" : "live.gain~[55]"
				}
,
				"obj-2::obj-27.2::obj-21" : 				{
					"parameter_longname" : "live.gain~[1]"
				}
,
				"obj-2::obj-39::obj-46.28::obj-14" : 				{
					"parameter_longname" : "ws_freq[27]"
				}
,
				"obj-5::obj-5::obj-60.7::obj-38" : 				{
					"parameter_longname" : "live.dial[13]"
				}
,
				"obj-5::obj-5::obj-60.27::obj-4" : 				{
					"parameter_longname" : "live.gain~[70]"
				}
,
				"obj-5::obj-5::obj-60.32::obj-4" : 				{
					"parameter_longname" : "live.gain~[75]"
				}
,
				"obj-2::obj-27.4::obj-65" : 				{
					"parameter_longname" : "live.gain~[6]"
				}
,
				"obj-2::obj-39::obj-46.15::obj-14" : 				{
					"parameter_longname" : "ws_freq[14]"
				}
,
				"obj-2::obj-39::obj-46.43::obj-14" : 				{
					"parameter_longname" : "ws_freq[42]"
				}
,
				"obj-2::obj-39::obj-46.59::obj-14" : 				{
					"parameter_longname" : "ws_freq[58]"
				}
,
				"obj-5::obj-5::obj-60.4::obj-4" : 				{
					"parameter_longname" : "live.gain~[47]"
				}
,
				"obj-5::obj-5::obj-60.11::obj-38" : 				{
					"parameter_longname" : "live.dial[30]"
				}
,
				"obj-5::obj-5::obj-60.18::obj-4" : 				{
					"parameter_longname" : "live.gain~[61]"
				}
,
				"obj-2::obj-27.5::obj-65" : 				{
					"parameter_longname" : "live.gain~[8]"
				}
,
				"obj-2::obj-39::obj-46.4::obj-14" : 				{
					"parameter_longname" : "ws_freq[3]"
				}
,
				"obj-2::obj-39::obj-46.33::obj-14" : 				{
					"parameter_longname" : "ws_freq[32]"
				}
,
				"obj-6::obj-15.4::obj-8" : 				{
					"parameter_longname" : "live.gain~[26]"
				}
,
				"obj-2::obj-39::obj-46.20::obj-14" : 				{
					"parameter_longname" : "ws_freq[19]"
				}
,
				"obj-2::obj-39::obj-46.48::obj-14" : 				{
					"parameter_longname" : "ws_freq[47]"
				}
,
				"obj-4::obj-42" : 				{
					"parameter_longname" : "live.dial[24]",
					"parameter_range" : [ 0.0, 1.0 ],
					"parameter_unitstyle" : 1
				}
,
				"obj-5::obj-5::obj-60.6::obj-38" : 				{
					"parameter_longname" : "live.dial[12]"
				}
,
				"obj-5::obj-5::obj-60.22::obj-4" : 				{
					"parameter_longname" : "live.gain~[65]"
				}
,
				"obj-2::obj-39::obj-46.64::obj-14" : 				{
					"parameter_longname" : "ws_freq[63]"
				}
,
				"obj-6::obj-15.8::obj-8" : 				{
					"parameter_longname" : "live.gain~[30]"
				}
,
				"obj-5::obj-5::obj-60.10::obj-4" : 				{
					"parameter_longname" : "live.gain~[53]"
				}
,
				"obj-2::obj-27.8::obj-65" : 				{
					"parameter_longname" : "live.gain~[17]"
				}
,
				"obj-4::obj-41" : 				{
					"parameter_longname" : "live.dial[23]",
					"parameter_range" : [ 0.0, 1.0 ],
					"parameter_unitstyle" : 1
				}
,
				"obj-4::obj-17" : 				{
					"parameter_longname" : "rvb_diff",
					"parameter_linknames" : 1,
					"parameter_shortname" : "Diffusion"
				}
,
				"obj-2::obj-39::obj-46.9::obj-14" : 				{
					"parameter_longname" : "ws_freq[8]"
				}
,
				"obj-2::obj-39::obj-46.38::obj-14" : 				{
					"parameter_longname" : "ws_freq[37]"
				}
,
				"obj-5::obj-5::obj-60.11::obj-4" : 				{
					"parameter_longname" : "live.gain~[54]"
				}
,
				"obj-5::obj-5::obj-60.16::obj-38" : 				{
					"parameter_longname" : "live.dial[33]"
				}
,
				"obj-2::obj-27.8::obj-23" : 				{
					"parameter_longname" : "live.dial[7]"
				}
,
				"obj-2::obj-39::obj-46.24::obj-14" : 				{
					"parameter_longname" : "ws_freq[23]"
				}
,
				"obj-2::obj-39::obj-46.53::obj-14" : 				{
					"parameter_longname" : "ws_freq[52]"
				}
,
				"obj-4::obj-3" : 				{
					"parameter_longname" : "water_vol",
					"parameter_linknames" : 1
				}
,
				"obj-5::obj-5::obj-60.25::obj-38" : 				{
					"parameter_longname" : "live.dial[42]"
				}
,
				"obj-2::obj-27.3::obj-65" : 				{
					"parameter_longname" : "live.gain~[4]"
				}
,
				"obj-6::obj-15.10::obj-8" : 				{
					"parameter_longname" : "live.gain~[32]"
				}
,
				"obj-2::obj-39::obj-46.27::obj-14" : 				{
					"parameter_longname" : "ws_freq[26]"
				}
,
				"obj-2::obj-27.3::obj-23" : 				{
					"parameter_longname" : "live.dial[2]"
				}
,
				"obj-2::obj-39::obj-46.14::obj-14" : 				{
					"parameter_longname" : "ws_freq[13]"
				}
,
				"obj-2::obj-39::obj-46.42::obj-14" : 				{
					"parameter_longname" : "ws_freq[41]"
				}
,
				"obj-2::obj-27.1::obj-21" : 				{
					"parameter_longname" : "live.gain~"
				}
,
				"obj-2::obj-39::obj-46.58::obj-14" : 				{
					"parameter_longname" : "ws_freq[57]"
				}
,
				"obj-5::obj-5::obj-60.22::obj-38" : 				{
					"parameter_longname" : "live.dial[39]"
				}

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "osc_manager.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "evt.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "states.txt",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/data",
				"patcherrelativepath" : "../data",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "watersys.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "water_spin~.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "autopan.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "water_trail~.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mixer.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "yafr2.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "icesys.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ice_block~.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "vaporsys.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "vapor_hover~.maxpat",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "storage.json",
				"bootpath" : "G:/UNI/Semestre 2/EDM4600/TP2/sublima-p5/sublima-maxmsp/data",
				"patcherrelativepath" : "../data",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "OpenSoundControl.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "OSC-route.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0
	}

}
