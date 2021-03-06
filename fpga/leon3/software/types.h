/****************************************************************************
* Project        : Welec W2000A
*****************************************************************************
* File           : types.h
* Author         : Alexander Lindert <alexander_lindert at gmx.at>
* Date           : 20.04.2009
*****************************************************************************
* Description	 : 
*****************************************************************************

*  Copyright (c) 2009, Alexander Lindert

*  This program is free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.

*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.

*  You should have received a copy of the GNU General Public License
*  along with this program; if not, write to the Free Software
*  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*  For commercial applications where source-code distribution is not
*  desirable or possible, I offer low-cost commercial IP licenses.
*  Please contact me per mail.

*****************************************************************************
* Remarks		: -
* Revision		: 0
****************************************************************************/
#ifndef TYPES_H
#define TYPES_H

#ifdef MINGW
#error "GUGugugu"
#endif

#ifndef __cplusplus

#define bool    int
#define true    1
#define false   0

#define STDCALL

#else /* __cplusplus */

#define STDCALL __stdcall
#endif

// Fix the following to use a portable stdint.h on Windows; all C99 conforming platforms should have stdint.h
// Several can be found here: http://en.wikipedia.org/wiki/Stdint.h (under External Links)
#if defined WIN32 && !(defined __MINGW32__) || defined W2000A
typedef unsigned char  uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int   uint32_t;
typedef unsigned int   uintptr_t;
#ifndef __int8_t_defined
#define __int8_t_defined
typedef char            int8_t;
#endif
typedef short           int16_t;
typedef int             int32_t;
#else //defined
#include <stdint.h>
#endif //defined

typedef union {
	int32_t i;
	int16_t s[2];
	int8_t  c[4];
} uSample;

#endif
