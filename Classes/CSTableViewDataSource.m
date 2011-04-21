/*
 * cocoshop
 *
 * Copyright (c) 2011 Andrew
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "CSTableViewDataSource.h"

@implementation CSTableViewDataSource

@synthesize dictionary=dictionary_;

+ (id)dataSourceWithDictionary:(NSMutableDictionary *)dict
{
	return [[[self alloc] initWithDictionary:dict] autorelease];
}

- (id)initWithDictionary:(NSMutableDictionary *)dict
{
	if((self=[super init]))
	{
		[self setDictionary:dict];
	}
	
	return self;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
	if(dictionary_)
	{
		NSArray *values = [dictionary_ allValues];
		return [[values objectAtIndex:rowIndex] name];
	}
	
	return nil;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
	NSArray *values = [dictionary_ allValues];
	return [values count];
	return 1;
}

- (void)dealloc
{
	[self setDictionary:nil];
	[super dealloc];
}

@end