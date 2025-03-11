<script>
	import UI from '../../ui/index.js'
	import { createEventDispatcher } from 'svelte'

	const dispatch = createEventDispatcher()

	let { field } = $props()

	// Initialize options object if it doesn't exist
	if (!field.options) field.options = {}

	// Set defaults if values don't exist
	if (field.options.maxSizeMB === undefined) field.options.maxSizeMB = 1
	if (field.options.maxWidthOrHeight === undefined) field.options.maxWidthOrHeight = 1920

	// Listen for changes to dispatch updates to parent
	function handle_change() {
		dispatch('input', { options: field.options })
	}
</script>

<div class="ImageFieldOptions">
	<h3>Image Compression</h3>
	<div class="option-group">
		<UI.TextInput type="number" label="Max Size (MB)" bind:value={field.options.maxSizeMB} on:input={handle_change} />
		<div class="option-help">Maximum file size after compression</div>
	</div>

	<div class="option-group">
		<UI.TextInput type="number" label="Max Dimension (px)" bind:value={field.options.maxWidthOrHeight} on:input={handle_change} />
		<div class="option-help">Maximum width or height in pixels</div>
	</div>
</div>
