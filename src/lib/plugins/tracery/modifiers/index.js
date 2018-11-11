'use strict';

const deepMerge = require(`../../../util/deep-merge.js`);

let modifiers = {};

modifiers = deepMerge(modifiers, require('./basic-modifiers'));
modifiers = deepMerge(modifiers, require('./cardfinder-modifiers'));
modifiers = deepMerge(modifiers, require('./content-modifiers'));
modifiers = deepMerge(modifiers, require('./scryfall-modifiers'));

module.exports = modifiers;