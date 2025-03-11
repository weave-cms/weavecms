<script>
    import UI from '../../ui/index.js'
    import { createEventDispatcher } from 'svelte'
    import { writable } from 'svelte/store'
    
    const dispatch = createEventDispatcher()
    
    let { field } = $props()
    
    let maxSizeMB = writable(field.options?.maxSizeMB ?? 1)
    let maxWidthOrHeight = writable(field.options?.maxWidthOrHeight ?? 1920)
    
    function dispatch_update() {
        dispatch('input', { 
            options: { 
                ...field.options, 
                maxSizeMB, 
                maxWidthOrHeight 
            } 
        })
    }
</script>

<div class="ImageFieldOptions">
    <h3>Image Compression</h3>
    <div class="option-group">
        <UI.TextInput
            type="number"
            label="Max Size (MB)"
            value={$maxSizeMB}
            on:input={(e) => {
                const target = e.target;
                if (target) {
                    const value = target.value;
                    maxSizeMB.set(parseFloat(value));
                    dispatch_update();
                }
            }}
        />
        <div class="option-help">Maximum file size after compression</div>
    </div>
    
    <div class="option-group">
        <UI.TextInput
            type="number"
            value={$maxWidthOrHeight}
            on:input={(e) => {
                const target = e.target;
                if (target) {
                    const value = target.value;
                    maxSizeMB.set(parseFloat(value));
                    dispatch_update();
                }
            }}
        />
        <div class="option-help">Maximum width or height in pixels</div>
    </div>
</div>

<style lang="postcss">
    .ImageFieldOptions {
        display: grid;
        gap: 1rem;
    }
    
    h3 {
        font-size: var(--font-size-2);
        margin: 0;
        color: var(--color-gray-2);
    }
    
    .option-group {
        display: grid;
        gap: 0.25rem;
    }
    
    .option-help {
        font-size: var(--font-size-1);
        color: var(--color-gray-4);
    }
</style>