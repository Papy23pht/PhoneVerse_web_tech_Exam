/**
 * Showcase Card Fix for Modals
 * This script specifically targets and fixes the showcase cards in modals
 * ensuring proper display of product images and content
 */

document.addEventListener("DOMContentLoaded", function () {
  // Wait a little for other scripts to initialize
  setTimeout(function () {
    console.log("🎯 Applying showcase card fixes for modals");

    // Fix modal showcase cards specifically
    document.querySelectorAll(".modal .showcase").forEach(function (showcase) {
      // Fix the showcase wrapper styling
      showcase.setAttribute(
        "style",
        `
        display: block !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        border-radius: 8px !important;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
        background: white !important;
        overflow: hidden !important;
      `
      );

      // Fix the showcase banner (product image container)
      const showcaseBanner = showcase.querySelector(".showcase-banner");
      if (showcaseBanner) {
        showcaseBanner.setAttribute(
          "style",
          `
          position: relative !important;
          width: 100% !important;
          height: 250px !important;
          overflow: hidden !important;
          border-radius: 8px 8px 0 0 !important;
          display: block !important;
          margin: 0 !important;
          padding: 0 !important;
        `
        );

        // Fix the product images
        showcaseBanner.querySelectorAll("img").forEach(function (img) {
          img.setAttribute(
            "style",
            `
            width: 100% !important;
            height: 100% !important;
            object-fit: cover !important;
            transition: transform 0.5s !important;
            display: block !important;
          `
          );
        });

        // Fix showcase badge if present
        const badge = showcaseBanner.querySelector(".showcase-badge");
        if (badge) {
          badge.setAttribute(
            "style",
            `
            position: absolute !important;
            top: 15px !important;
            left: 15px !important;
            background: var(--furnifind-primary, #4e8d7c) !important;
            color: white !important;
            font-size: 0.8rem !important;
            font-weight: 600 !important;
            padding: 0.25em 0.75em !important;
            border-radius: 4px !important;
            z-index: 3 !important;
          `
          );
        }

        // Fix showcase action buttons
        const actions = showcaseBanner.querySelector(".showcase-actions");
        if (actions) {
          actions.setAttribute(
            "style",
            `
            position: absolute !important;
            top: 10px !important;
            right: 10px !important;
            display: flex !important;
            flex-direction: column !important;
            gap: 8px !important;
            z-index: 3 !important;
          `
          );

          // Fix each action button
          actions.querySelectorAll(".btn-action").forEach(function (btn) {
            btn.setAttribute(
              "style",
              `
              background: white !important;
              color: var(--furnifind-dark, #333) !important;
              border: none !important;
              border-radius: 50% !important;
              width: 35px !important;
              height: 35px !important;
              display: flex !important;
              align-items: center !important;
              justify-content: center !important;
              box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15) !important;
              cursor: pointer !important;
            `
            );
          });
        }
      }

      // Fix the content area
      const showcaseContent = showcase.querySelector(".showcase-content");
      if (showcaseContent) {
        showcaseContent.setAttribute(
          "style",
          `
          padding: 15px !important;
          text-align: left !important;
        `
        );

        // Fix showcase title
        const title = showcaseContent.querySelector(".showcase-title");
        if (title) {
          title.setAttribute(
            "style",
            `
            font-size: 1rem !important;
            color: var(--furnifind-dark, #333) !important;
            font-weight: 600 !important;
            margin-bottom: 5px !important;
            overflow: hidden !important;
            text-overflow: ellipsis !important;
            white-space: nowrap !important;
          `
          );
        }

        // Fix showcase category
        const category = showcaseContent.querySelector(".showcase-category");
        if (category) {
          category.setAttribute(
            "style",
            `
            color: var(--furnifind-secondary, #777) !important;
            font-size: 0.85rem !important;
            font-weight: 500 !important;
            text-transform: uppercase !important;
            margin-bottom: 5px !important;
            display: block !important;
          `
          );
        }

        // Fix price box
        const priceBox = showcaseContent.querySelector(".price-box");
        if (priceBox) {
          priceBox.setAttribute(
            "style",
            `
            display: flex !important;
            gap: 10px !important;
            align-items: center !important;
          `
          );

          // Fix price
          const price = priceBox.querySelector(".price");
          if (price) {
            price.setAttribute(
              "style",
              `
              font-size: 1.1rem !important;
              font-weight: 700 !important;
              color: var(--furnifind-primary, #4e8d7c) !important;
            `
            );
          }

          // Fix original price
          const del = priceBox.querySelector("del");
          if (del) {
            del.setAttribute(
              "style",
              `
              font-size: 0.9rem !important;
              color: #777 !important;
            `
            );
          }
        }
      }
    });

    console.log("✅ Showcase card fixes applied");
  }, 1000); // Wait 1 second after DOM is ready
});
