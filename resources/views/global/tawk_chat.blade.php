@if(isset($general_setting) && (!isset($general_setting->tawk_status) || $general_setting->tawk_status == 1) && !empty($general_setting->tawk_chat_link))
    @php
        $tawk_src = $general_setting->tawk_chat_link;
        if (preg_match('/src=[\'"]([^\'"]+)[\'"]/i', $tawk_src, $matches)) {
            $tawk_src = $matches[1];
        } elseif (preg_match('/embed\.tawk\.to\/([^\/\s\'"]+)\/([^\/\s\'"]+)/i', $tawk_src, $matches)) {
            $tawk_src = 'https://embed.tawk.to/' . $matches[1] . '/' . $matches[2];
        } elseif (!str_starts_with($tawk_src, 'http')) {
            $tawk_src = 'https://embed.tawk.to/' . ltrim($tawk_src, '/');
        }
    @endphp
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='{{ $tawk_src }}';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->
@endif
