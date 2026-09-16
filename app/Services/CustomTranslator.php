<?php

namespace App\Services;

use Illuminate\Translation\Translator as BaseTranslator;

class CustomTranslator extends BaseTranslator
{
    /**
     * Get the translation for the given key.
     *
     * @param  string  $key
     * @param  array  $replace
     * @param  string|null  $locale
     * @param  bool  $fallback
     * @return string|array
     */
    public function get($key, array $replace = [], $locale = null, $fallback = true)
    {
        $result = parent::get($key, $replace, $locale, $fallback);

        // If the translation key is missing and Laravel returned 'translate.Foo Bar' literally,
        // automatically fallback to the clean label string 'Foo Bar' with any replacements.
        if (is_string($result) && $result === $key && str_starts_with($key, 'translate.')) {
            $cleaned = substr($key, 10);
            return $this->makeReplacements($cleaned, $replace);
        }

        return $result;
    }
}
