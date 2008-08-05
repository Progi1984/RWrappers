------------------------------------------
Type :			Wrapper
Objet :			FreeImage (http://freeimage.sourceforge.net/)
Auteur : 		Progi1984
Site :			http://progi1984.free.fr
------------------------------------------
Install :
	1.	Begin by this code
			--------------------------------
				IncludeFile "FreeImage_Res.pb"
				IncludeFile "FreeImage_Inc.pb"
				FreeImage_Initialise()
			--------------------------------
	2	Finish by this code
			--------------------------------
				FreeImage_DeInitialise()
			--------------------------------
------------------------------------------
Historique :
	0.1			01/11/07 	Release FreeImage 3.9.3
	0.1.1		15/01/08	FIXED : Sample_0
	0.1.2		16/01/08	ADDED : Sample_1
							ADDED : Sample_2
	0.1.3		04/03/08	Release FreeImage 3.10.0
							ADDED : FreeImage_TmoFattal02
							ADDED : FreeImage_MultigridPoissonSolver
							ADDED : FreeImage_PreMultiplyWithAlpha
							ADDED : FreeImage_SetTransparentIndex
							ADDED : FreeImage_GetTransparentIndex
							ADDED : FreeImage_GetAdjustColorsLookupTable
							ADDED : FreeImage_AdjustColors
							ADDED : FreeImage_ApplyColorMapping
							ADDED : FreeImage_SwapColors
							ADDED : FreeImage_ApplyPaletteIndexMapping
							ADDED : FreeImage_SwapPaletteIndices
	0.1.4		07/03/08	Compatible Unicode
							

