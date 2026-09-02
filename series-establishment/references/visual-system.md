# Visual System

Use this reference when creating or auditing character art, location art, or image-generation prompts.

## Start with one visual thesis

Write one sentence describing the series' visual tension, then translate it into decisions rather than mood words. Define line color and weight, shape language, coloring method, palette roles, materials, lighting, perspective, age proportions, supernatural symbol grammar, lived-in detail, and exclusions.

## Character design contract

Every important character needs three independent recognition channels:

1. silhouette or proportion;
2. face or hair feature;
3. costume color, asymmetry, or prop.

Define left/right details explicitly and forbid mirroring when they carry identity. Give each character a small repair, mismatch, wear mark, or practical habit that reveals personality without clutter.

For non-human mascots, lock scale, asymmetric features, movement method, emotional expression, powers, and transformation prohibitions.

## Prompt construction

Use this order:

1. fixed series prefix;
2. subject or location identity;
3. composition and camera;
4. structural anchors;
5. materials and palette;
6. lighting and atmosphere;
7. action or expression;
8. drift prohibitions;
9. shared negative prompt.

Provide a detailed prompt for high-capability generators and a compact prompt for shorter-context generators. Compact means reduced wording, not removed anchors. Do not combine conflicting directions such as flat cel shading with photorealistic skin.

Treat the fixed prefix as current-session context, not permanent model memory. A project usage guide must tell beginners to re-send it when starting a new conversation, changing models, or losing context. Static character and location prompts define reusable identity; page, spread, panel, pose, weather, and plot-state instructions are appended for the current image rather than written back into the static library.

## Location hierarchy

### Primary locations

Primary locations affect series geography, theme, or recurring plot. Give each a stable overall identity and three non-drift anchors.

### Secondary locations

Secondary locations are rooms, corridors, shops, fields, or facilities inside or attached to a primary location. Group them under the parent and inherit its materials, palette, scale, window language, and wear patterns.

### Plot-state variants

Movement, magical distortion, destruction, festival dressing, and weather emergencies are episode-specific states. Keep them outside the reusable static-location library unless the user asks for a dedicated variant library.

## Visual continuity gate

- Are style prefix and palette identical across prompts?
- Are character left/right features preserved?
- Do group prompts preserve every character's proportions and costume?
- Can each primary location be recognized without signage?
- Do secondary scenes visibly belong to their parent location?
- Is supernatural imagery limited to the defined symbol grammar?
- Are negative prompts preventing photorealism, style drift, unreadable text, duplicate structures, and unapproved characters?
