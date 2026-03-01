USE [MesProduction]
GO

-- Process numbers will be divided into their loops, even though there is also a loop number.
--   i.e. (1#### is loop 1, 2#### is loop 2, etc.)
-- All BCRs are typically located before a process equipment and will follow the pattern of process number - 5 (i.e if EDGE_GRIND is 10170, then EDGE_GRIND_BCR is 10165)
-- Minimum of 10 buffer between processes to leave room for new processes later on
-- Processes bundled together at the same location can be closer.  For example, the grinder, marker and cutting table are on the same overhead mount so they are only separated by 2 (10110,10112,10114)
-- All BCRs on entry to sorting will be <loop#>9905 (+5 if multiple entry points).  It will always be the last process in the loop and will be placed at the end to signify this.  At the moment, no plans to have BCRs coming out of the sorter.
begin tran
select * from Global.Process

INSERT INTO [Global].[Process]
           ([Number]
           ,[Name]
           ,[LoopNumber])
     VALUES
		   -- *** LAB RWC *** --
		   ('00050','LAB_UV_VIS_MEASUREMENT',0),
           ('00100','LAB_SHEET_RESISTANCE_MEASUREMENT',0),
           ('00150','LAB_PRE_P1_COMAC_STAGING',0),
           ('00200','LAB_PRE_P1_COMAC_CLEANING',0),
           ('00250','LAB_P1_SCRIBE',0),
           ('00300','LAB_POST_P1_SCRIBE_TEST',0),
           ('00350','LAB_BUSBAR_PRINT',0),
           ('00400','LAB_BUSBAR_FIRING',0),
           ('00450','LAB_PRE_NEBULA_COMAC_STAGING',0),
           ('00500','LAB_PRE_NEBULA_COMAC_CLEANING',0),
           ('00550','LAB_NEBULA_PARKING',0),
           ('00600','LAB_ACTIVE_LAYER_COATER',0),
           ('00650','LAB_P2_SCRIBE',0),
           ('00700','LAB_TOP_ELECTRODE_COATER',0),
           ('00750','LAB_P3_SCRIBE',0),
           ('00800','LAB_MODULE_A_TEST',0),
           ('00850','LAB_THIN_FILM_ENCAPSULATION_COATER',0),
           ('00900','LAB_MODULE_B_TEST',0),
           ('00950','LAB_ZETA_IMAGING',0),
           ('01000','LAB_IGU_ASSEMBLY',0),
           ('02000','LAB_IGU_ARGON_TEST',0),
           ('02050','LAB_IGU_CURING',0),
           ('02100','LAB_IGU_POLISHING',0),
           ('02150','LAB_MODULE_C_TEST',0),
           ('02200','LAB_IGU_UV_VIS_MEASUREMENT',0),
           ('02250','LAB_IGU_INSPECTION',0),
           ('02300','LAB_VOC_TEST',0),
           ('02350','LAB_CLASSIFICATION',0),

		   -- *** LOOP 1 ***

           -- Glass loading and polishing
		   ('10010','UNPOLISHED_GLASS_LOAD',1),
           ('10015','POLISHED_GLASS_LOAD',1),
           ('10020','PRE_POLISH_INSPECT',1),
           ('10025','POLISHED_GLASS_BUFFER',1),
           ('10030','GLASS_POLISH',1),
           ('10040','POST_POLISH_INSPECT',1),
           ('10050','POST_POLISH_WASHER',1),
           ('10100','JUMBO_GLASS_LOAD',1),
           ('10105','JUMBO_GLASS_UNLOAD',1),
           
		   -- Grinding, cutting, marking
		   ('10110','RAW_GLASS_CUT',1),
           ('10112','RAW_GLASS_GRIND',1),
           ('10114','BARCODE_MARKER',1),
		   ('10115','POST_MARKING_BCR',1),
		   ('10120','BREAKOUT_X',1),
		   ('10130','BREAKOUT_Y',1),
		   ('10140','BREAKOUT_Z',1),
           ('10165','PRE_EDGE_GRIND_BCR',1),
		   ('10170','EDGE_GRIND',1),
		   ('10180','POST_EDGE_GRIND_WASHER',1),
		   ('10190','FIDUCIAL_MARKER',1),  -- Currently not drawn, checking into it.
		   ('10200','EDGE_SHAPE_QC',1),
		   ('19905','SORT_LOOP_1_1_ENTRY_BCR',1),
           
		   -- *** LOOP 2 ***
		   -- There are two exits for the sorter into loop 2.  
		   -- So this looks a bit odd with two washer processes, but we can't assume Line A and Line B washers here.  
		   -- If we introduce new equipment into the 2_2 exit, the lines will get out of sync.
		   ('20010','SORT_LOOP_2_1_EXIT_WASHER',2),
           ('20012','SORT_LOOP_2_2_EXIT_WASHER',2),
           ('20015','EDGE_PRINT_BCR',2),
           ('20020','EDGE_PRINT',2),
           ('20030','EDGE_PRINT_IR_DRYING',2),
           ('20045','EDGE_PRINT_FIRING_BCR',2),
           ('20050','EDGE_PRINT_FIRING',2),
           ('20105','TEMPERING_BCR',2),
           ('20110','TEMPERING',2),
           ('20120','TEMPERING_QC',2),
		   ('20205','BUSBAR_APPLY_BCR',2),
           ('20210','BUSBAR_APPLY',2),
           ('20220','BUSBAR_IR_DRYING',2),
           ('20235','BUSBAR_FIRING_BCR',2),
           ('20240','BUSBAR_FIRING',2),
           ('20250','EDGE_PRINT_BUSBAR_QC',2),
           ('29905','SORT_LOOP_2_3_ENTRY_BCR',2),
           ('29910','SORT_LOOP_2_4_ENTRY_BCR',2),
           
           
		   -- *** LOOP 3 ***
		   -- Lamination
		   -- Same as loop 2, there are two exits for lamination.  We may also use both for different types of glass, but primarily one will be mothersheets and the other, outer lites. 
		   ('30010','SORT_LOOP_3_1_EXIT_WASHER',3),
           ('30012','SORT_LOOP_3_2_EXIT_WASHER',3),
           
		   -- hmm, maybe just use lines here?
		   -- If they become dedicate to mother sheet vs lites, then yes.  If not, could combine.
		   ('30025','LAMINATE_LAYUP_1_BCR',3),
           ('30030','LAMINATE_LAYUP_1',3),
           ('30035','LAMINATE_LAYUP_2_BCR',3),
           ('30040','LAMINATE_LAYUP_2',3),
           ('30050','NIP_ROLL',3),
           ('30060','AUTOCLAVE_LOAD',3),
           ('30070','AUTOCLAVE',3),
           ('30080','AUTOCLAVE_UNLOAD',3),
           ('30100','POST_LAMINATION_WASHER',3),
           ('30110','LAMINATION_QC',3),
           ('39905','SORT_LOOP_3_3_ENTRY_BCR',3),
           
		   -- *** LOOP 4 ***
		   -- Scribes and Coating
		   -- Scribe 1 is buffered by 100 because there's a lot of room in front of it.
		   ('40105','P1_SCRIBE_BCR',4),
           ('40110','P1_SCRIBE',4),
           --('40115','POST_P1_SCRIBE_QC_BCR',4), -- not in there yet
           ('40120','POST_P1_SCRIBE_QC',4),
           ('40125','PRE_ACTIVE_LAYER_COATER_BUFFER_BCR',4),
           ('40130','PRE_ACTIVE_LAYER_COATER_BUFFER',4),
           ('40205','ACTIVE_LAYER_COATER_BCR',4),
           ('40210','ACTIVE_LAYER_COATER',4),
           -- ('40215','ACTIVE_LAYER_COATER_QC_BCR',4), -- not in there yet
           ('40220','ACTIVE_LAYER_COATER_QC',4),
           ('40225','P2_SCRIBE_BCR',4),
           ('40230','P2_SCRIBE',4),
           ('40245','PRE_TOP_ELECTRODE_COATER_BUFFER_BCR',4),
           ('40250','PRE_TOP_ELECTRODE_COATER_BUFFER',4),
           --('40255','PRE_TOP_ELECTRODE_QC_BCR',4), -- not in there yet
           ('40260','PRE_TOP_ELECTRODE_QC',4),
           ('40275','TOP_ELECTRODE_COATER_BCR',4),
           ('40280','TOP_ELECTRODE_COATER',4),
           ('40295','POST_TOP_ELECTRODE_COATER_QC_BCR',4),
           ('40300','POST_TOP_ELECTRODE_COATER_QC',4),
           ('40315','P3_SCRIBE_BCR',4),
           ('40320','P3_SCRIBE',4),
           ('40330','P4_SCRIBE',4), -- no BCR for P4 yet, will use virtual tracking from P3
           ('40345','PRE_ALD_COATER_BUFFER_BCR',4),
           ('40350','PRE_ALD_COATER_BUFFER',4),
           --('40355','PRE_ALD_COATER_QC_BCR',4), -- not in there yet
           ('40360','PRE_ALD_COATER_QC',4),
           ('40365','ALD_COATER_BCR',4),
           ('40370','ALD_COATER',4),
           ('40375','POST_ALD_COATER_BUFFER_BCR',4),
           ('40380','POST_ALD_COATER_BUFFER',4),
           --('40385','POST_ALD_COATER_QC_BCR',4), -- not in there yet
           ('40390','POST_ALD_COATER_QC',4),
           ('40395','POST_ALD_ELIPSOMETER_BCR',4),
           ('40400','POST_ALD_ELIPSOMETER',4),
           ('49905','SORT_LOOP_4_2_ENTRY_BCR',4),
		   ('49910','SORT_LOOP_4_3_ENTRY_BCR',4),
		   
		   -- *** LOOP 5 ***
		   -- LED, Cut and Separate
		   ('50025','LED_BCR',5),
           ('50030','LED',5),
           --('50045','POST_LED_QC_BCR',5), -- not in there yet
           ('50050','POST_LED_QC',5),
           ('50055','CUT_SEPARATE_BCR',5),
           ('50060','CUT_SEPARATE_Y1',5),
           ('50070','CUT_SEPARATE_X1',5),
           ('50080','CUT_SEPARATE_Y2',5),
           --('50085','POST_CUT_SEPARATE_QC_BCR',5), -- not in there yet
           ('50090','POST_CUT_SEPARATE_QC',5),
           ('50105','POST_CUT_SEPARATE_FLASH_TEST_BCR',5),
           ('50110','POST_CUT_SEPARATE_FLASH_TEST',5),
           ('50115','POST_FLASH_TEST_IR_DEFECT_BCR',5),
           ('50120','POST_FLASH_TEST_IR_DEFECT',5),
           ('50125','POST_FLASH_TEST_BUFFER_BCR',5),
           ('50130','POST_FLASH_TEST_BUFFER',5),
           ('59905','SORT_LOOP_5_2_ENTRY_BCR',5),
		   
		   -- *** LOOP 6 ***
		   -- IGU
		   ('60010','SORT_LOOP_6_1_EXIT_AIR_KNIFE',6),
           ('60020','SORT_LOOP_6_2_EXIT_WASHER',6),
           ('60045','PRE_IGU_ASSEMBLY_QC_BCR',6),
           ('60050','PRE_IGU_ASSEMBLY_QC',6),
           ('60055','SPACER_TPS_1_BCR',6),
           ('60060','SPACER_ASSEMBLY_1',6),
           ('60062','TPS_DISPENSE_1',6),
           ('60065','SOLDERING_BCR',6),
           ('60070','SOLDERING',6),
           ('60075','SPACER_TPS_2_BCR',6),
           ('60080','SPACER_ASSEMBLY_2',6),
           ('60082','TPS_DISPENSE_2',6),
           ('60095','GAS_FILL_PRESS_BCR',6),
           ('60100','GAS_FILL_PRESS',6),
           --('60105','POST_GAS_FILL_PRESS_QC_BCR',5), -- not in there yet
           ('60110','POST_GAS_FILL_PRESS_QC',6),
           ('60130','MANUAL_SECONDARY_SEAL_1',6),
           ('60135','AUTO_SECONDARY_SEAL_BCR',6),
           ('60140','AUTO_SECONDARY_SEAL',6),
           ('60150','MANUAL_SECONDARY_SEAL_2',6),
           ('60160','EXTERIOR_WIRE_CONNECT',6),
           ('69905','IGU_UNLOAD_BCR',6),
		   ('69910','IGU_UNLOAD',6),
		   ('69915','IGU_UNLOAD_RACK_BCR',6),
		   ('69920','IGU_UNLOAD_RACK',6),
		   
		   -- *** LOOP 7 ***
		   -- Final QC and Packaging
		   ('70005','FINAL_QC_LOAD_RACK_BCR',7),
		   ('70010','FINAL_QC_LOAD_RACK',7),
		   ('70020','FINAL_QC_LOAD',7),
		   ('70035','FINAL_QC_VISUAL_INSPECT_BCR',7),
		   ('70040','FINAL_QC_VISUAL_INSPECT',7),
		   ('70045','FINAL_QC_FLASH_TEST_BCR',7),
		   ('70050','FINAL_QC_FLASH_TEST',7),
		   ('70080','FINAL_QC_PROTECTIVE_WRAP',7),
		   ('79905','FINAL_QC_UNLOAD_BCR',7),
		   ('79910','FINAL_QC_UNLOAD',7),
		   ('79915','FINAL_QC_UNLOAD_RACK_BCR',7),
		   ('79920','FINAL_QC_UNLOAD_RACK',7)


select * from Global.Process order by Number

--ROLLBACK
COMMIT

-- check for duplicates
--select Number, count(processid) 
--from Global.Process 
--group by Number 
--having COUNT(processid) > 1