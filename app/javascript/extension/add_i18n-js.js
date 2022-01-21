import { I18n } from 'i18n-js';
import translations from "../locales.json";

const i18n = new I18n(translations);

global.i18n = i18n;