<table ="">
<colgroup>
<col style="width: 33.3333%;">
<col style="width: 33.3333%;">
<col style="width: 33.3334%;">
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Constants supported</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><p =""><code>ascii</code></p></td>
<td><p =""><code>string</code></p></td>
<td><p ="">ASCII character string</p></td>
</tr>
<tr>
<td><p =""><code>bigint</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">64-bit signed long</p></td>
</tr>
<tr>
<td><p =""><code>blob</code></p></td>
<td><p =""><code>blob</code></p></td>
<td><p ="">Arbitrary bytes (no validation)</p></td>
</tr>
<tr>
<td><p =""><code>boolean</code></p></td>
<td><p =""><code>boolean</code></p></td>
<td><p ="">Either <code>true</code> or <code>false</code></p></td>
</tr>
<tr>
<td><p =""><code>counter</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">Counter column (64-bit signed value). See <code>counters</code> for details.</p></td>
</tr>
<tr>
<td><p =""><code>date</code></p></td>
<td><p =""><code>integer</code>, <code>string</code></p></td>
<td><p ="">A date (with no corresponding time value). See <code>dates</code> below for details.</p></td>
</tr>
<tr>
<td><p =""><code>decimal</code></p></td>
<td><p =""><code>integer</code>, <code>float</code></p></td>
<td><p ="">Variable-precision decimal</p></td>
</tr>
<tr>
<td><p =""><code>double</code></p></td>
<td><p =""><code>integer</code> <code>float</code></p></td>
<td><p ="">64-bit IEEE-754 floating point</p></td>
</tr>
<tr>
<td><p =""><code>duration</code></p></td>
<td><p =""><code>duration</code>,</p></td>
<td><p ="">A duration with nanosecond precision. See <code>durations</code> below for details.</p></td>
</tr>
<tr>
<td><p =""><code>float</code></p></td>
<td><p =""><code>integer</code>, <code>float</code></p></td>
<td><p ="">32-bit IEEE-754 floating point</p></td>
</tr>
<tr>
<td><p =""><code>inet</code></p></td>
<td><p =""><code>string</code></p></td>
<td><p ="">An IP address, either IPv4 (4 bytes long) or IPv6 (16 bytes long). Note
that there is no <code>inet</code> constant, IP address should be input as strings.</p></td>
</tr>
<tr>
<td><p =""><code>int</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">32-bit signed int</p></td>
</tr>
<tr>
<td><p =""><code>smallint</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">16-bit signed int</p></td>
</tr>
<tr>
<td><p =""><code>text</code></p></td>
<td><p =""><code>string</code></p></td>
<td><p ="">UTF8 encoded string</p></td>
</tr>
<tr>
<td><p =""><code>time</code></p></td>
<td><p =""><code>integer</code>, <code>string</code></p></td>
<td><p ="">A time (with no corresponding date value) with nanosecond precision. See
<code>times</code> below for details.</p></td>
</tr>
<tr>
<td><p =""><code>timestamp</code></p></td>
<td><p =""><code>integer</code>, <code>string</code></p></td>
<td><p ="">A timestamp (date and time) with millisecond precision. See <code>timestamps</code>
below for details.</p></td>
</tr>
<tr>
<td><p =""><code>timeuuid</code></p></td>
<td><p =""><code>uuid</code></p></td>
<td><p ="">Version 1 <a href="https://en.wikipedia.org/wiki/Universally_unique_identifier">UUID</a>,
generally used as a “conflict-free” timestamp. Also see <code>timeuuid-functions</code>.</p></td>
</tr>
<tr>
<td><p =""><code>tinyint</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">8-bit signed int</p></td>
</tr>
<tr>
<td><p =""><code>uuid</code></p></td>
<td><p =""><code>uuid</code></p></td>
<td><p ="">A <a href="https://en.wikipedia.org/wiki/Universally_unique_identifier">UUID</a> (of any version)</p></td>
</tr>
<tr>
<td><p =""><code>varchar</code></p></td>
<td><p =""><code>string</code></p></td>
<td><p ="">UTF8 encoded string</p></td>
</tr>
<tr>
<td><p =""><code>varint</code></p></td>
<td><p =""><code>integer</code></p></td>
<td><p ="">Arbitrary-precision integer</p></td>
</tr>
</tbody>
</table>