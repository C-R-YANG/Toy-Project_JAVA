package kr.co.ch.bori.common.tiles;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TileConfig {

    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer tilesConfigurer = new TilesConfigurer();

        tilesConfigurer.setDefinitions("WEB-INF/tiles/tiles.xml");
        tilesConfigurer.setCheckRefresh(true);

        return tilesConfigurer;
    }

    @Bean
    public UrlBasedViewResolver urlBasedViewResolver() {
        UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();

        urlBasedViewResolver.setViewClass(TilesView.class);
        urlBasedViewResolver.setOrder(1);

        return urlBasedViewResolver;
    }
}
